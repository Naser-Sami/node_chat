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

    sl.registerLazySingleton<ContactsBloc>(
      () => ContactsBloc(
        sl(),
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

    sl.registerLazySingleton<ContactsRemoteDataSource>(
      () => ContactsRemoteDataSource(),
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

    sl.registerLazySingleton<ContactsRepository>(
      () => ContactsRepositoryImpl(
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

    sl.registerLazySingleton<FetchContactsUseCase>(
      () => FetchContactsUseCase(
        sl(),
      ),
    );

    sl.registerLazySingleton<AddContactUseCase>(
      () => AddContactUseCase(
        sl(),
      ),
    );

    sl.registerLazySingleton<CheckOrCreateConversationUseCase>(
          () => CheckOrCreateConversationUseCase(
        sl(),
      ),
    );
  }
}
