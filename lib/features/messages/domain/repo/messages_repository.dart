
import '/features/messages/_messages.dart';

abstract class MessagesRepository {
  Future<void> sendMessage(MessageEntity message);
  Future<List<MessageEntity>> fetchMessages(String conversationId);
}