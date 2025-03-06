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

  static fromJson(Map<String, dynamic> userMap) {
    return AuthEntity(
      userId: userMap['userId'],
      name: userMap['name'] ?? '',
      email: userMap['email'] ?? '',
      phone: userMap['phone'] ?? '',
      image: userMap['image'],
      password: '',
    );
  }
}
