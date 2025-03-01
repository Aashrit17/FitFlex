import 'package:dartz/dartz.dart';
import 'package:fitflex/core/error/failure.dart';
import 'package:fitflex/features/exercise/domain/entity/exercise_entity.dart';


abstract interface class IExerciseRepository {
  Future<Either<Failure, List<ExerciseEntity>>> getExercises();
  Future<Either<Failure, void>> createExercise(ExerciseEntity item);
  Future<Either<Failure, void>> deleteExercise(String id, String? token);
}