import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '/core/_core.dart';
import '/features/messages/_messages.dart';

part 'messages_event.dart';

part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  final FetchMessagesUseCase _fetchMessagesUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final _storage = const FlutterSecureStorage();
  final SocketService _socketService = SocketService();
  final List<MessageEntity> _messages = [];

  MessagesBloc(this._fetchMessagesUseCase, this._sendMessageUseCase) : super(MessagesInitialState()) {
    on<LoadMessagesEvent>(_onLoadMessages);
    on<SendMessageEvent>(_onSendMessage);
    on<ReceiveMessageEvent>(_onReceiveMessage);
  }

  Future<void> _onLoadMessages(LoadMessagesEvent event, Emitter<MessagesState> emit) async {
    emit(MessagesLoadingState());
    try {
      final message = await _fetchMessagesUseCase.call(event.conversationId);
      _messages.clear();
      _messages.addAll(message);

      emit(MessagesLoadedState(messages: List.from(_messages)));

      _socketService.socket.emit("joinConversation", event.conversationId);
      _socketService.socket.on("newMessage", (data) {
        log("step 1 - receive: $data");
        add(ReceiveMessageEvent(message: data));
      });
    } catch (e) {
      emit(MessagesErrorState(message: "On Load Message Error: $e"));
    }
  }

  Future<void> _onSendMessage(SendMessageEvent event, Emitter<MessagesState> emit) async {
    final userId = await _storage.read(key: 'userId');
    log("UserId = $userId");

    final newMessage = {
      "conversationId": event.conversationId,
      "senderId": userId,
      "content": event.content,
    };

    _socketService.socket.emit("sendMessage", newMessage);
  }

  Future<void> _onReceiveMessage(ReceiveMessageEvent event, Emitter<MessagesState> emit) async {
    log("step 2 - receive event called");
    log(event.message.toString());

    final message = MessageEntity(
      id: event.message['id'] as String,
      conversationId: event.message['conversation_id'] as String,
      senderId: event.message['sender_id'] as String,
      content: event.message['content'] as String,
      createdAt: event.message['created_at'] as String,
    );

    _messages.add(message);
    emit(MessagesLoadedState(messages: List.from(_messages)));
  }
}
