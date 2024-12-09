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
      id: json['conversation_id'] ?? '',
      participantName: json['participant_name']  ?? '',
      lastMessage: json['last_message']  ?? '',
      lastMessageTime: json['last_message_time']  ?? '',
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
