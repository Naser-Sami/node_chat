part of 'messages_bloc.dart';

sealed class MessagesEvent extends Equatable {
  const MessagesEvent();
}

class LoadMessagesEvent extends MessagesEvent {
  final String conversationId;

  const LoadMessagesEvent({required this.conversationId});

  @override
  List<Object?> get props => [conversationId];
}

class SendMessageEvent extends MessagesEvent {
  final String conversationId;
  final String content;

  const SendMessageEvent({required this.conversationId, required this.content});

  @override
  List<Object?> get props => [conversationId, content];
}

class ReceiveMessageEvent extends MessagesEvent {
  final Map<String, dynamic> message;

  const ReceiveMessageEvent({required this.message});

  @override
  List<Object?> get props => [message];
}
