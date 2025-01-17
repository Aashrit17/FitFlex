part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUser extends RegisterEvent {
  final BuildContext context;
  final String name;
  final String email;
  final String phone;
  final String password;

  const RegisterUser({
    required this.context,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });
}
