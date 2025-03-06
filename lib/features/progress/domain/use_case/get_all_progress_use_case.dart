import 'package:dartz/dartz.dart';
import 'package:fitflex/app/shared_prefs/token_shared_prefs.dart';
import 'package:fitflex/app/usecase/usecase.dart';
import 'package:fitflex/core/error/failure.dart';
import 'package:fitflex/features/progress/domain/entity/progress_entity.dart';
import 'package:fitflex/features/progress/domain/repository/progress_repository.dart';

class GetAllProgressUseCase
    implements UsecaseWithoutParams<List<ProgressHistoryEntity>> {
  final IProgressRepository progressRepository;
  final TokenSharedPrefs tokenSharedPrefs;

  GetAllProgressUseCase({
    required this.progressRepository,
    required this.tokenSharedPrefs,
  });

  @override
  Future<Either<Failure, List<ProgressHistoryEntity>>> call() async {
    print('GetAllProgressUseCase called');

    final userResult = await tokenSharedPrefs.getUser();

    if (userResult == null) {
      return const Left(
        SharedPrefsFailure(message: "No user data found in shared preferences"),
      );
    }

    final userId = userResult['_id'];
    print("id is being passed $userId");
    if (userId == null || userId.isEmpty) {
      return const Left(
        SharedPrefsFailure(message: "User ID not found in shared preferences"),
      );
    }

    return await progressRepository.getProgress(userId, userId);
  }
}
