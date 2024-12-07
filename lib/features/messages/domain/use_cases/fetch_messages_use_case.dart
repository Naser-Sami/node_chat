import '/features/messages/_messages.dart';

class FetchMessagesUseCase {
  final MessagesRepository _messageRepository;
  FetchMessagesUseCase(this._messageRepository);

  Future<List<MessageEntity>> call(String conversationId) async {
    return await _messageRepository.fetchMessages(conversationId);
  }
}