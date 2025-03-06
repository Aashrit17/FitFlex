import 'dart:io';

import 'package:fitflex/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthDataSource {
  Future<String> loginUser(String name, String password);

  Future<void> registerUser(AuthEntity user);

  Future<AuthEntity> getCurrentUser(String? token, String userId);

  Future<String> uploadProfilePicture(File file);

  Future<AuthEntity> updateUser(AuthEntity userId );

}
