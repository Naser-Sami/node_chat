import '/features/conversations/_conversations.dart';

class CheckOrCreateConversationUseCase {
  final ConversationsRepository repo;
  CheckOrCreateConversationUseCase(this.repo);

  Future<String> call(String contactId) async {
    return await repo.checkOrCreateConversation(contactId);
  }
}