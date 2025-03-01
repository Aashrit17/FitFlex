import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fitflex/app/shared_prefs/token_shared_prefs.dart';
import 'package:fitflex/app/usecase/usecase.dart';
import 'package:fitflex/core/error/failure.dart';
import 'package:fitflex/features/exercise/domain/repository/exercise_repository.dart';


class DeleteExerciseParams extends Equatable {
  final String exerciseId;

  const DeleteExerciseParams({required this.exerciseId});

  const DeleteExerciseParams.empty() : exerciseId = '_empty.string';

  @override
  List<Object?> get props => [
        exerciseId,
      ];
}

class DeleteExerciseUsecase implements UsecaseWithParams<void, DeleteExerciseParams> {
  final IExerciseRepository exerciseRepository;
  final TokenSharedPrefs tokenSharedPrefs;

  DeleteExerciseUsecase({
    required this.exerciseRepository,
    required this.tokenSharedPrefs,
  });

  @override
  Future<Either<Failure, void>> call(DeleteExerciseParams params) async {
    // Get token from Shared Preferences and send it to the server
    final token = await tokenSharedPrefs.getToken();
    return token.fold((l) {
      return Left(l);
    }, (r) async {
      return await exerciseRepository.deleteExercise(params.exerciseId, r);
    });
  }
}
