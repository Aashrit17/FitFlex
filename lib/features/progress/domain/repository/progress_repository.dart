import 'package:dartz/dartz.dart';
import 'package:fitflex/core/error/failure.dart';
import 'package:fitflex/features/progress/domain/entity/progress_entity.dart';


abstract interface class IProgressRepository {
  Future<Either<Failure, List<ProgressEntity>>> getProgress();
  Future<Either<Failure, void>> createProgress(ProgressEntity item);
//   Future<Either<Failure, void>> deleteProgress(String id, String? token);
}