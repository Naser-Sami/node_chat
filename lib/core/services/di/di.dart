import 'package:get_it/get_it.dart';
import 'package:node_chat/core/_core.dart';

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

    sl.registerLazySingleton<ConversationsBloc>(
      () => ConversationsBloc(
        sl(),
      ),
    );

    sl.registerLazySingleton<MessagesBloc>(
      () => MessagesBloc(
        sl(),
        sl(),
      ),
    );

    // CUBIT's
    sl.registerLazySingleton<ThemeCubit>(
      () => ThemeCubit(),
    );

    // PROVIDERS
    sl.registerLazySingleton<SocketService>(
      () => SocketService(),
    );

    // LOCAL STORAGE

    // DATASOURCE'S
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(),
    );

    sl.registerLazySingleton<ConversationsRemoteDataSource>(
      () => ConversationsRemoteDataSource(),
    );

    sl.registerLazySingleton<MessagesRemoteDataSource>(
      () => MessagesRemoteDataSource(),
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

    sl.registerLazySingleton<MessagesRepository>(
      () => MessagesRepositoryImpl(
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

    sl.registerLazySingleton<FetchMessagesUseCase>(
      () => FetchMessagesUseCase(
        sl(),
      ),
    );

    sl.registerLazySingleton<SendMessageUseCase>(
      () => SendMessageUseCase(
        sl(),
      ),
    );
  }
}
