import 'package:equatable/equatable.dart';

class ConversationEntity extends Equatable {
  final String id;
  final String participantName;
  final String lastMessage;
  final String lastMessageTime;

  const ConversationEntity({
    required this.id,
    required this.participantName,
    required this.lastMessage,
    required this.lastMessageTime,
  });

  ConversationEntity copyWith({
    String? id,
    String? participantName,
    String? lastMessage,
    String? lastMessageTime,
  }) {
    return ConversationEntity(
      id: id ?? this.id,
      participantName: participantName ?? this.participantName,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
    );
  }

  @override
  String toString() {
    return 'ConversationEntity(id: $id, participantName: $participantName, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime)';
  }

  @override
  List<Object?> get props => [
        id,
        participantName,
        lastMessage,
        lastMessageTime,
      ];
}
