import 'package:equatable/equatable.dart';
import 'package:fitflex/app/constants/hive_table_constants.dart';
import 'package:fitflex/features/auth/domain/entity/auth_entity.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? userId;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  final String password;

  AuthHiveModel({
    String? userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();

  const AuthHiveModel.initial()
      : userId = '',
        name = '',
        email = '',
        phone = '',
        password = '';

  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      userId: entity.userId,
      name: entity.name,
      email: entity.email,
      phone: entity.phone,
      password: entity.password,
    );
  }

  AuthEntity toEntity() {
    return AuthEntity(
      userId: userId,
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
  }

  @override
  List<Object?> get props => [userId, name, email, phone, password];
}
