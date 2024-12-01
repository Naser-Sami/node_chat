part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final String message;
  AuthSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class AuthFailureState extends AuthState {
  final String error;
  AuthFailureState(this.error);

  @override
  List<Object> get props => [error];
}
