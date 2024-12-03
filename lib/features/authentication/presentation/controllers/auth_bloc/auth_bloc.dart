import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '/features/authentication/domain/use_cases/_use_cases.dart';

part 'auth_events.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final _storage = const FlutterSecureStorage();

  AuthBloc({required this.registerUseCase, required this.loginUseCase}) : super(AuthInitialState()) {
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin);
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());

    try {
      final user = await registerUseCase.call(event.username, event.email, event.password);
      log(user.toString());
      emit(AuthSuccessState('User registered successfully'));
    } catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      final user = await loginUseCase.call(event.email, event.password);
      log(user.toString());
      await _storage.write(key: 'token', value: user.token);
      emit(AuthSuccessState('User logged in successfully'));
    } catch (e) {
      emit(AuthFailureState(e.toString()));
    }
  }
}
