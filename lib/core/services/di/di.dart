import 'package:get_it/get_it.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/_features.dart';

// Global Variable
// Initialize GetIt
final sl = GetIt.I;

class DI {
  Future<void> init() async {
    ApiClient.initDio();

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

    // DATASOURCE'S
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(),
    );

    sl.registerLazySingleton<ConversationsRemoteDataSource>(
      () => ConversationsRemoteDataSource(),
    );

    // REPOSITORIES
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        sl(),
      ),
    );

    sl.registerLazySingleton<ConversationsRepository>(
      () => ConversationsRepositoryImpl(
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

    sl.registerLazySingleton<FetchConversationsUseCase>(
      () => FetchConversationsUseCase(
        repo: sl(),
      ),
    );
  }
}
