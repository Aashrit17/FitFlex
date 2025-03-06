import 'package:equatable/equatable.dart';
import 'package:fitflex/features/auth/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String name;
  
  final String? image;
  final String email;
  final String phone;
  final String? password;

  const AuthApiModel({
    this.id,
    required this.name,
    required this.image,
    required this.email,
    required this.phone,
    required this.password,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: id,
      name: name,
      email: email,
      phone: phone,
      image: image,
      password: password ?? '',
    );
  }

  // From Entity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      name: entity.name,
      image: entity.image,
      email: entity.email,
      phone: entity.phone,
      password: entity.password,
    );
  }

  @override
  List<Object?> get props => [name, image, email, phone, password];
}
