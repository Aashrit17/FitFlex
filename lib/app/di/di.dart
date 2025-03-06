import 'package:dio/dio.dart';
import 'package:fitflex/app/shared_prefs/token_shared_prefs.dart';
import 'package:fitflex/core/network/api_service.dart';
import 'package:fitflex/core/network/hive_service.dart';
import 'package:fitflex/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:fitflex/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:fitflex/features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
import 'package:fitflex/features/auth/data/repository/auth_remote_repository/auth_remote_repository.dart';
import 'package:fitflex/features/auth/domain/use_case/get_user_usecase.dart';
import 'package:fitflex/features/auth/domain/use_case/login_usecase.dart';
import 'package:fitflex/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:fitflex/features/auth/domain/use_case/update_user_usecase.dart';
import 'package:fitflex/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:fitflex/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:fitflex/features/auth/presentation/view_model/profile/profile_bloc.dart';
import 'package:fitflex/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:fitflex/features/exercise/data/data_source/remote_data_source/exercise_remote_data_source.dart';
import 'package:fitflex/features/exercise/data/repository/exercise_remote_repository.dart';
import 'package:fitflex/features/exercise/domain/use_case/create_exercise_use_case.dart';
import 'package:fitflex/features/exercise/domain/use_case/delete_exercise_use_case.dart';
import 'package:fitflex/features/exercise/domain/use_case/get_all_exercise_use_case.dart';
import 'package:fitflex/features/exercise/presentation/view_model/exercise_bloc.dart';
import 'package:fitflex/features/food/data/data_source/remote_data_source/food_remote_data_source.dart';
import 'package:fitflex/features/food/data/repository/food_remote_repository.dart';
import 'package:fitflex/features/food/domain/use_case/create_food_use_case.dart';
import 'package:fitflex/features/food/domain/use_case/delete_food_use_case.dart';
import 'package:fitflex/features/food/domain/use_case/get_all_food_use_case.dart';
import 'package:fitflex/features/food/presentation/view_model/food_bloc.dart';
import 'package:fitflex/features/home/presentation/view_model/home_cubit.dart';
import 'package:fitflex/features/progress/data/data_source/remote_data_source/progress_remote_data_source.dart';
import 'package:fitflex/features/progress/data/repository/progress_remote_repository.dart';
import 'package:fitflex/features/progress/domain/use_case/get_all_progress_use_case.dart';
import 'package:fitflex/features/progress/presentation/view_model/progress_bloc.dart';
import 'package:fitflex/features/splash/presentation/view_model/cubit/onboarding_cubit.dart';
import 'package:fitflex/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // First initialize hive service
  await _initHiveService();
  await _initApiService();

  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initSharedPreferences();
  await _initOnboardingScreenDependencies();
  await _initSplashScreenDependencies();
  await _initFoodDependencies();
  await _initExerciseDependencies();
  await _initProfileDependencies();
  await _initProgressDependencies();
}

Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

_initApiService() {
  // init Api
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initRegisterDependencies() {
  // init local data source
  getIt.registerLazySingleton(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );

  //remote datasource auth
  getIt.registerFactory<AuthRemoteDatasource>(
    () => AuthRemoteDatasource(getIt<Dio>(), getIt<TokenSharedPrefs>()),
  );

  // init local repository
  getIt.registerLazySingleton(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );

  //remote repo auth
  getIt.registerLazySingleton<AuthRemoteRepository>(
    () => AuthRemoteRepository(getIt<AuthRemoteDatasource>()),
  );

  // register use usecase
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerLazySingleton<UploadImageUsecase>(
    () => UploadImageUsecase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt(),
      uploadImageUsecase: getIt(),
    ),
  );
}

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}

_initLoginDependencies() async {
  getIt.registerLazySingleton<TokenSharedPrefs>(
    () => TokenSharedPrefs(getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(
      getIt<AuthRemoteRepository>(),
      getIt<TokenSharedPrefs>(),
    ),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUseCase: getIt<LoginUseCase>(),
    ),
  );
}

_initFoodDependencies() async {
  // =========================== Data Source ===========================
  // getIt.registerFactory<BatchLocalDataSource>(
  //     () => BatchLocalDataSource(hiveService: getIt<HiveService>()));

  getIt.registerLazySingleton<FoodRemoteDataSource>(
    () => FoodRemoteDataSource(
      getIt<Dio>(),
    ),
  );

  // =========================== Repository ===========================

  // getIt.registerLazySingleton<ItemLocalRepository>(() => BatchLocalRepository(
  //     batchLocalDataSource: getIt<BatchLocalDataSource>()));

  getIt.registerLazySingleton(
    () => FoodRemoteRepository(
      remoteDataSource: getIt<FoodRemoteDataSource>(),
    ),
  );

  // =========================== Usecases ===========================

  getIt.registerLazySingleton<CreateFoodUseCase>(
    () => CreateFoodUseCase(foodRepository: getIt<FoodRemoteRepository>()),
  );

  getIt.registerLazySingleton<GetAllFoodUseCase>(
    () => GetAllFoodUseCase(foodRepository: getIt<FoodRemoteRepository>()),
  );

  getIt.registerLazySingleton<DeleteFoodUsecase>(
    () => DeleteFoodUsecase(
      foodRepository: getIt<FoodRemoteRepository>(),
      tokenSharedPrefs: getIt<TokenSharedPrefs>(),
    ),
  );

  // =========================== Bloc ===========================
  getIt.registerFactory<FoodBloc>(
    () => FoodBloc(
      createFoodUseCase: getIt<CreateFoodUseCase>(),
      getAllFoodUseCase: getIt<GetAllFoodUseCase>(),
      deleteFoodUsecase: getIt<DeleteFoodUsecase>(),
    ),
  );
}

_initExerciseDependencies() async {
  // =========================== Data Source ===========================
  // getIt.registerFactory<BatchLocalDataSource>(
  //     () => BatchLocalDataSource(hiveService: getIt<HiveService>()));

  getIt.registerLazySingleton<ExerciseRemoteDataSource>(
    () => ExerciseRemoteDataSource(
      getIt<Dio>(),
    ),
  );

  // =========================== Repository ===========================

  // getIt.registerLazySingleton<ItemLocalRepository>(() => BatchLocalRepository(
  //     batchLocalDataSource: getIt<BatchLocalDataSource>()));

  getIt.registerLazySingleton(
    () => ExerciseRemoteRepository(
      remoteDataSource: getIt<ExerciseRemoteDataSource>(),
    ),
  );

  // =========================== Usecases ===========================

  getIt.registerLazySingleton<CreateExerciseUseCase>(
    () => CreateExerciseUseCase(
        exerciseRepository: getIt<ExerciseRemoteRepository>()),
  );

  getIt.registerLazySingleton<GetAllExerciseUseCase>(
    () => GetAllExerciseUseCase(
        exerciseRepository: getIt<ExerciseRemoteRepository>()),
  );

  getIt.registerLazySingleton<DeleteExerciseUsecase>(
    () => DeleteExerciseUsecase(
      exerciseRepository: getIt<ExerciseRemoteRepository>(),
      tokenSharedPrefs: getIt<TokenSharedPrefs>(),
    ),
  );

  // =========================== Bloc ===========================
  getIt.registerFactory<ExerciseBloc>(
    () => ExerciseBloc(
      createExerciseUseCase: getIt<CreateExerciseUseCase>(),
      getAllExerciseUseCase: getIt<GetAllExerciseUseCase>(),
      deleteExerciseUsecase: getIt<DeleteExerciseUsecase>(),
    ),
  );
}

_initProgressDependencies() async {
  // =========================== Data Source ===========================
  // getIt.registerFactory<BatchLocalDataSource>(
  //     () => BatchLocalDataSource(hiveService: getIt<HiveService>()));

  getIt.registerLazySingleton<ProgressRemoteDataSource>(
    () => ProgressRemoteDataSource(
      getIt<Dio>(),
    ),
  );

  // =========================== Repository ===========================

  // getIt.registerLazySingleton<ItemLocalRepository>(() => BatchLocalRepository(
  //     batchLocalDataSource: getIt<BatchLocalDataSource>()));

  getIt.registerLazySingleton(
    () => ProgressRemoteRepository(
      remoteDataSource: getIt<ProgressRemoteDataSource>(),
    ),
  );

  // =========================== Usecases ===========================

  // getIt.registerLazySingleton<CreateProgressUseCase>(
  //   () => CreateExerciseUseCase(
  //       exerciseRepository: getIt<ExerciseRemoteRepository>()),
  // );

  getIt.registerLazySingleton<GetAllProgressUseCase>(
    () => GetAllProgressUseCase(
      progressRepository: getIt<ProgressRemoteRepository>(),
      tokenSharedPrefs: getIt<TokenSharedPrefs>(),
    ),
  );

  // getIt.registerLazySingleton<DeleteProgressUsecase>(
  //   () => DeleteExerciseUsecase(
  //     exerciseRepository: getIt<ExerciseRemoteRepository>(),
  //     tokenSharedPrefs: getIt<TokenSharedPrefs>(),
  //   ),
  // );

  // =========================== Bloc ===========================
  getIt.registerFactory<ProgressBloc>(
    () => ProgressBloc(
      getAllProgressUseCase: getIt<GetAllProgressUseCase>(),
    ),
  );
}

_initProfileDependencies() async {
  getIt.registerLazySingleton<GetUserUsecase>(
    () => GetUserUsecase(
      tokenSharedPrefs: getIt<TokenSharedPrefs>(),
    ),
  );

  getIt.registerLazySingleton<UpdateUserUsecase>(
    () => UpdateUserUsecase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  getIt.registerFactory<ProfileBloc>(
    () => ProfileBloc(
        tokenSharedPrefs: getIt<TokenSharedPrefs>(),
        updateUserUsecase: getIt<UpdateUserUsecase>(),
        getUserUsecase: getIt<GetUserUsecase>()),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<OnboardingCubit>()),
  );
}

_initOnboardingScreenDependencies() async {
  getIt.registerFactory<OnboardingCubit>(
    () => OnboardingCubit(),
  );
}
