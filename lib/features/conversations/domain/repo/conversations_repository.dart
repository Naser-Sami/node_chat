
import '/features/conversations/_conversations.dart';

abstract class ConversationsRepository {
  Future<List<ConversationEntity>> fetchConversations();
}