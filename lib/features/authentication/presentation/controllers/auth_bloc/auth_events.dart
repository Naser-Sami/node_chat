part of 'auth_bloc.dart';

abstract class AuthEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterEvent extends AuthEvents {
  final String username;
  final String email;
  final String password;

  RegisterEvent({
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [username, email, password];
}

class LoginEvent extends AuthEvents {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
