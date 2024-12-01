part of 'auth_bloc.dart';

abstract class AuthEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterEvent extends AuthEvents {
  final String username;
  final String email;
  final String password;

  RegisterEvent(this.username, this.email, this.password);

  @override
  List<Object> get props => [username, email, password];
}

class LoginEvent extends AuthEvents {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
