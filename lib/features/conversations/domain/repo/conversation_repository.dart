
import '/features/conversations/_conversations.dart';

abstract class ConversationRepository {
  Future<List<ConversationEntity>> fetchConversations();
}