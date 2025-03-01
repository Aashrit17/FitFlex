import 'package:dartz/dartz.dart';
import 'package:fitflex/app/usecase/usecase.dart';
import 'package:fitflex/core/error/failure.dart';
import 'package:fitflex/features/exercise/domain/entity/exercise_entity.dart';
import 'package:fitflex/features/exercise/domain/repository/exercise_repository.dart';


class GetAllExerciseUseCase implements UsecaseWithoutParams<List<ExerciseEntity>> {
  final IExerciseRepository exerciseRepository;

  GetAllExerciseUseCase({required this.exerciseRepository});

  @override
  Future<Either<Failure, List<ExerciseEntity>>> call() {
    print('GetAllExerciseUseCase called');
    return exerciseRepository.getExercises();
  }
}