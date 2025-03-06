import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fitflex/core/error/failure.dart';
import 'package:fitflex/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, void>> registerUser(AuthEntity user);

  Future<Either<Failure, String>> loginUser(String name, String password);

  Future<Either<Failure, String>> uploadProfilePicture(File file);

  Future<Either<Failure, AuthEntity>> getCurrentUser(String? token, String userID);

  // Future<Either<Failure, AuthEntity>> getCurrentUser(String? token, String userID);

  Future<Either<Failure, AuthEntity>> updateUser(AuthEntity user);
}
