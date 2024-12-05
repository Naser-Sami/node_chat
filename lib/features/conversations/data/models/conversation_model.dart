import 'package:equatable/equatable.dart';

class ConversationModel extends Equatable {
  final String id;
  final String participantName;
  final String lastMessage;
  final String lastMessageTime;

  const ConversationModel({
    required this.id,
    required this.participantName,
    required this.lastMessage,
    required this.lastMessageTime,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      id: json['conversation_id'] as String,
      participantName: json['participant_name'] as String,
      lastMessage: json['last_message'] as String,
      lastMessageTime: json['last_message_time'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'conversation_id': id,
      'participant_name': participantName,
      'last_message': lastMessage,
      'last_message_time': lastMessageTime,
    };
  }

  factory ConversationModel.empty() {
    return const ConversationModel(
      id: "",
      participantName: "",
      lastMessage: "",
      lastMessageTime: "",
    );
  }

  @override
  List<Object?> get props => [
        id,
        participantName,
        lastMessage,
        lastMessageTime,
      ];
}
