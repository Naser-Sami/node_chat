import '/features/messages/_messages.dart';

class MessagesMapper {
  MessagesMapper._();

  // Convert MessageModel to MessageEntity
  static MessageEntity toEntity(MessageModel model) {
    return MessageEntity(
      id: model.id,
      conversationId: model.conversationId,
      senderId: model.senderId,
      content: model.content,
      createdAt: model.createdAt,
    );
  }

  // Convert MessageEntity to MessageModel (if needed, e.g., for saving data back)
  static MessageModel toModel(MessageEntity entity) {
    return MessageModel(
      id: entity.id,
      conversationId: entity.conversationId,
      senderId: entity.senderId,
      content: entity.content,
      createdAt: entity.createdAt,
    );
  }
}
