import 'package:dartz/dartz.dart';
import 'package:fitflex/core/error/failure.dart';
import 'package:fitflex/features/exercise/data/data_source/remote_data_source/exercise_remote_data_source.dart';
import 'package:fitflex/features/exercise/domain/entity/exercise_entity.dart';
import 'package:fitflex/features/exercise/domain/repository/exercise_repository.dart';


class ExerciseRemoteRepository implements IExerciseRepository {
  final ExerciseRemoteDataSource remoteDataSource;

  ExerciseRemoteRepository({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> createExercise(ExerciseEntity exercise) async {
    try {
      remoteDataSource.createExercise(exercise);
      return Right(null);
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteExercise(String id, String? token) async {
    try {
      remoteDataSource.deleteExercise(id, token);
      return Right(null);
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<ExerciseEntity>>> getExercises() async {
    try {
      final exercises = await remoteDataSource.getExercises();
      return Right(exercises);
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }
}