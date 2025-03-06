import 'package:dartz/dartz.dart';
import 'package:fitflex/core/error/failure.dart';
import 'package:fitflex/features/progress/data/data_source/remote_data_source/progress_remote_data_source.dart';
import 'package:fitflex/features/progress/domain/entity/progress_entity.dart';
import 'package:fitflex/features/progress/domain/repository/progress_repository.dart';

class ProgressRemoteRepository implements IProgressRepository {
  final ProgressRemoteDataSource remoteDataSource;

  ProgressRemoteRepository({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ProgressEntity>>> getProgress() async {
    try {
      final progresses = await remoteDataSource.getProgress();
      return Right(progresses);
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> createProgress(ProgressEntity progress) async {
    try {
      remoteDataSource.createProgress(progress);
      return const Right(null);
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
