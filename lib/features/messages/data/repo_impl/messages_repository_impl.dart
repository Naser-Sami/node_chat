import '/features/messages/_messages.dart';

class MessagesRepositoryImpl implements MessagesRepository {
  final MessagesRemoteDataSource messagesRemoteDataSource;

  MessagesRepositoryImpl(this.messagesRemoteDataSource);

  @override
  Future<List<MessageEntity>> fetchMessages(String conversationId) async {
    final messageModels = await messagesRemoteDataSource.fetchMessages(conversationId);
    return messageModels.map(MessagesMapper.toEntity).toList();
  }

  @override
  Future<void> sendMessage(MessageEntity message) async {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }
}
