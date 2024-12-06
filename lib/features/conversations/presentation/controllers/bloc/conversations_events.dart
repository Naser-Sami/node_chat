
part of 'conversations_bloc.dart';

abstract class ConversationsEvents extends Equatable {
  const ConversationsEvents();

  @override
  List<Object> get props => [];
}

class FetchConversationsEvent extends ConversationsEvents {}