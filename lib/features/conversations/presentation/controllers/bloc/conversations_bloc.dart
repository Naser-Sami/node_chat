
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/features/conversations/_conversations.dart';

part 'conversations_events.dart';
part 'conversations_states.dart';

class ConversationsBloc extends Bloc<ConversationsEvents, ConversationsState> {

  final FetchConversationsUseCase fetchConversationsUseCase;

  ConversationsBloc(this.fetchConversationsUseCase) : super(ConversationsInitialState()) {
    on<FetchConversationsEvent>(_onFetchConversations);
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