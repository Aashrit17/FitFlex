import 'package:dartz/dartz.dart';
import 'package:fitflex/core/error/failure.dart';
import 'package:fitflex/features/progress/domain/entity/progress_entity.dart';


abstract interface class IProgressRepository {
  Future<Either<Failure, List<ProgressHistoryEntity>>> getProgress(String? token, String id);
  Future<Either<Failure, void>> createProgress(ProgressEntity item);

  // getAllProgress({required userId}) {}
//   Future<Either<Failure, void>> deleteProgress(String id, String? token);
}