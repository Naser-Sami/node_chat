
import '/features/conversations/_conversations.dart';

class FetchConversationsUseCase {
  final ConversationsRepository repo;
  FetchConversationsUseCase({required this.repo});

  Future<List<ConversationEntity>> call() async {
    return repo.fetchConversations();
  }
}