part of 'messages_bloc.dart';

sealed class MessagesState extends Equatable {
  const MessagesState();
}

final class MessagesInitialState extends MessagesState {
  @override
  List<Object> get props => [];
}

class MessagesLoadingState extends MessagesState {
  @override
  List<Object> get props => [];
}

class MessagesLoadedState extends MessagesState {
  final List<MessageEntity> messages;

  const MessagesLoadedState({required this.messages});

  @override
  List<Object> get props => [messages];
}

class MessagesErrorState extends MessagesState {
  final String message;

  const MessagesErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
