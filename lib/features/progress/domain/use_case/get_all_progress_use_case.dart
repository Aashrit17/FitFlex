import 'package:dartz/dartz.dart';
import 'package:fitflex/app/usecase/usecase.dart';
import 'package:fitflex/core/error/failure.dart';
import 'package:fitflex/features/progress/domain/entity/progress_entity.dart';
import 'package:fitflex/features/progress/domain/repository/progress_repository.dart';


class GetAllProgressUseCase implements UsecaseWithoutParams<List<ProgressEntity>> {
  final IProgressRepository progressRepository;

  GetAllProgressUseCase({required this.progressRepository});

  @override
  Future<Either<Failure, List<ProgressEntity>>> call() {
    print('GetAllProgressUseCase called');
    return progressRepository.getProgress();
  }
}