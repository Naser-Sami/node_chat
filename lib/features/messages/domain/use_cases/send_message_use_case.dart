import '/features/messages/_messages.dart';

class SendMessageUseCase {
  final MessagesRepository _messageRepository;
  SendMessageUseCase(this._messageRepository);

  Future<void> call(MessageEntity message) async {
    return await _messageRepository.sendMessage(message);
  }
}