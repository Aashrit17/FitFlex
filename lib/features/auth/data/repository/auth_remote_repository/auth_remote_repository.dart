import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fitflex/core/error/failure.dart';
import 'package:fitflex/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:fitflex/features/auth/domain/entity/auth_entity.dart';
import 'package:fitflex/features/auth/domain/repository/auth_repository.dart';

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;
  AuthRemoteRepository(this._authRemoteDatasource);

  @override
  Future<Either<Failure, String>> loginUser(
      String email, String password) async {
    try {
      final result = await _authRemoteDatasource.loginUser(email, password);
      return Right(result);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    try {
      final imageName = await _authRemoteDatasource.uploadProfilePicture(file);
      return Right(imageName);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> registerUser(AuthEntity user) async {
    try {
      return Right(_authRemoteDatasource.registerUser(user));
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }
  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser(
      String? token, String userID) async {
    try {
      final user = await _authRemoteDatasource.getCurrentUser(token, userID);
      print("USERRR:: $user");
      return Right(user);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> updateUser(AuthEntity user) async {
    print('User update response:::::::');
    try {
      // var newUser = AuthEntity(
      //   fname: user.fname,
      //   lname: user.lname,
      //   email: user.email,
      //   phoneNo: user.phoneNo,
      //   address: user.address,
      //   username: user.address,
      //   password: currentUser.,
      // );
      final response = await _authRemoteDatasource.updateUser(user);
      print("User update response::: $response");
      return Right(response);
    } catch (e) {
      print('ERROR $e');
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
