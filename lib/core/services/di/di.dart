import 'package:get_it/get_it.dart';

import '/config/_config.dart';
import '/features/_features.dart';

// Global Variable
// Initialize GetIt
final sl = GetIt.I;

class DI {
  Future<void> init() async {
    // BLOC's
    sl.registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        registerUseCase: sl(),
        loginUseCase: sl(),
      ),
    );

    // CUBIT's

    sl.registerLazySingleton<ThemeCubit>(
      () => ThemeCubit(),
    );

    // LOCAL STORAGE

    // DATASOURCES
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(),
    );

    // REPOSITORIES
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        sl(),
      ),
    );

    // USE CASES
    sl.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(
        repo: sl(),
      ),
    );

    sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(
        repo: sl(),
      ),
    );
  }
}
