
import '/features/conversations/_conversations.dart';

class FetchConversationUseCase {
  final ConversationRepository repo;
  FetchConversationUseCase({required this.repo});

  Future<List<ConversationEntity>> call() async {
    return repo.fetchConversations();
  }
}