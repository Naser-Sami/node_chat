import '/features/conversations/_conversations.dart';

class ConversationMapper {
  ConversationMapper._();

  // Convert ConversationModel to ConversationEntity
  static ConversationEntity toEntity(ConversationModel model) {
    return ConversationEntity(
      id: model.id,
      participantName: model.participantName,
      lastMessage: model.lastMessage,
      lastMessageTime: DateTime.parse(model.lastMessageTime),
    );
  }

  // Convert ConversationEntity to ConversationModel (if needed, e.g., for saving data back)
  static ConversationModel toModel(ConversationEntity entity) {
    return ConversationModel(
      id: entity.id,
      participantName: entity.participantName,
      lastMessage: entity.lastMessage,
      lastMessageTime: entity.lastMessageTime.toIso8601String(),
    );
  }
}
