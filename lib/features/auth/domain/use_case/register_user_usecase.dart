import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fitflex/app/usecase/usecase.dart';
import 'package:fitflex/core/error/failure.dart';
import 'package:fitflex/features/auth/domain/entity/auth_entity.dart';
import 'package:fitflex/features/auth/domain/repository/auth_repository.dart';

class RegisterUserParams extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String? image;

  const RegisterUserParams({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.image,
  });

  //intial constructor
  const RegisterUserParams.initial({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.image,
  });

  @override
  List<Object?> get props => [name, image, email, phone, password];
}

class RegisterUseCase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity = AuthEntity(
      name: params.name,
      email: params.email,
      phone: params.phone,
      password: params.password,
      image: params.image,
    );
    return repository.registerUser(authEntity);
  }
}
