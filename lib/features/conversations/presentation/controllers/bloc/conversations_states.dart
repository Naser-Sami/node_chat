
part of 'conversations_bloc.dart';

abstract class ConversationsState extends Equatable {
  const ConversationsState();

  @override
  List<Object> get props => [];
}

class ConversationsInitialState extends ConversationsState {}

class ConversationsLoadingState extends ConversationsState {}

class ConversationsLoadedState extends ConversationsState {
  final List<ConversationEntity> conversations;
  const ConversationsLoadedState({required this.conversations});

  @override
  List<Object> get props => [conversations];
}

class ConversationsErrorState extends ConversationsState {
  final String message;
  const ConversationsErrorState({required this.message});

  @override
  List<Object> get props => [message];
}