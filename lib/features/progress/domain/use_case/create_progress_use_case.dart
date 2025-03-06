// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:fitflex/app/usecase/usecase.dart';
// import 'package:fitflex/core/error/failure.dart';
// import 'package:fitflex/features/exercise/domain/entity/exercise_entity.dart';
// import 'package:fitflex/features/exercise/domain/repository/exercise_repository.dart';

// class CreateProgressParams extends Equatable {
//   final String progressName;
//   final int progressCalorie;

//   const CreateExerciseParams({
//     required this.exerciseName,
//     required this.exerciseCalorie,
//   });

//   // Empty constructor
//   const CreateExerciseParams.empty()
//       : exerciseName = '_empty.string',
//         exerciseCalorie = 0;

//   @override
//   List<Object?> get props => [exerciseName];
// }

// class CreateExerciseUseCase implements UsecaseWithParams<void, CreateExerciseParams> {
//   final IExerciseRepository exerciseRepository;

//   CreateExerciseUseCase({required this.exerciseRepository});

//   @override
//   Future<Either<Failure, void>> call(CreateExerciseParams params) async {
//     return await exerciseRepository.createExercise(
//       ExerciseEntity(
//         name: params.exerciseName,
//         caloriesBPM: params.exerciseCalorie,
//       ),
//     );
//   }
// }
