import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String name;
  final String email;
  final String phone;
  final String password;
  final String? image;

  const AuthEntity({
    this.userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    this.image,
  });

  @override
  List<Object?> get props => [userId, name, email, phone, password];
}
