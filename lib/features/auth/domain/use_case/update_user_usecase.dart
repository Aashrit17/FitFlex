import 'package:dartz/dartz.dart';
import 'package:fitflex/core/error/failure.dart';
import 'package:fitflex/features/auth/domain/entity/auth_entity.dart';
import 'package:fitflex/features/auth/domain/repository/auth_repository.dart';

import '../../../../app/usecase/usecase.dart';

class UpdateUserUsecase implements UsecaseWithParams<void, AuthEntity> {
  final IAuthRepository repository;

  UpdateUserUsecase(this.repository);

  @override
  Future<Either<Failure, AuthEntity>> call(AuthEntity params) async {
    try {
      final authEntity = AuthEntity(
        name: params.name,
        email: params.email,
        phone: params.phone,
        password: params.password,
        image: params.image,
      );
      print('AUTHENTITY::: $authEntity');
      return repository.updateUser(authEntity);
    } catch (e) {
      return Left(
        SharedPrefsFailure(
            message: 'Unexpected error occurred: ${e.toString()}'),
      );
    }
  }
}
