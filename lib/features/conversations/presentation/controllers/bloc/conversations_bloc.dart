
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/_core.dart';
import '/features/conversations/_conversations.dart';

part 'conversations_events.dart';
part 'conversations_states.dart';

class ConversationsBloc extends Bloc<ConversationsEvents, ConversationsState> {

  final FetchConversationsUseCase fetchConversationsUseCase;
  final SocketService _socketService = SocketService();

  ConversationsBloc(this.fetchConversationsUseCase) : super(ConversationsInitialState()) {
    on<FetchConversationsEvent>(_onFetchConversations);
    _initializeSocketListeners();
  }

  void _initializeSocketListeners() {
    try {
      _socketService.socket.on("conversationUpdated", _onConversationUpdated);
    } catch (e) {
      log("Error initializing socket listeners: $e");
    }
  }

  void _onConversationUpdated(data) {
    add(FetchConversationsEvent());
  }

  Future<void> _onFetchConversations(FetchConversationsEvent event, Emitter<ConversationsState> emit) async {
    emit(ConversationsLoadingState());
    try {
      final conversations = await fetchConversationsUseCase.call();
      emit(ConversationsLoadedState(conversations: conversations));
    } catch (e) {
      emit(ConversationsErrorState(message: e.toString()));
    }
  }
}