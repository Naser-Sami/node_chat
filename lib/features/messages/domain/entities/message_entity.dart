import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String id;
  final String conversationId;
  final String senderId;
  final String content;
  final String createdAt;

  const MessageEntity({
    required this.id,
    required this.conversationId,
    required this.senderId,
    required this.content,
    required this.createdAt,
  });

  MessageEntity copyWith({
    String? id,
    String? conversationId,
    String? senderId,
    String? content,
    String? createdAt,
  }) {
    return MessageEntity(
      id: id ?? this.id,
      conversationId: conversationId ?? this.conversationId,
      senderId: senderId ?? this.senderId,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'ChatsEntity(id: $id, conversationId: $conversationId, senderId: $senderId, content: $content, createdAt: $createdAt)';
  }

  @override
  List<Object?> get props => [
        id,
        conversationId,
        senderId,
        content,
        createdAt,
      ];
}
