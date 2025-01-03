import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/_core.dart';
import 'config/_config.dart';
import 'features/_features.dart';

final providers = [
  BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
  BlocProvider<AuthBloc>(
    create: (context) => AuthBloc(
      registerUseCase: sl<RegisterUseCase>(),
      loginUseCase: sl<LoginUseCase>(),
    ),
  ),
  BlocProvider<ConversationsBloc>(
    create: (context) => ConversationsBloc(
      sl<FetchConversationsUseCase>(),
    ),
  ),
  BlocProvider<MessagesBloc>(
    create: (context) => MessagesBloc(
      sl<FetchMessagesUseCase>(),
      sl<SendMessageUseCase>(),
    ),
  ),
  BlocProvider<ContactsBloc>(
    create: (context) => ContactsBloc(
      sl<FetchContactsUseCase>(),
      sl<AddContactUseCase>(),
      sl<CheckOrCreateConversationUseCase>(),
    ),
  ),
];
