import '/features/conversations/_conversations.dart';

class ConversationsRepositoryImpl implements ConversationsRepository {
  final ConversationsRemoteDataSource conversationsRemoteDataSource;

  ConversationsRepositoryImpl(this.conversationsRemoteDataSource);

  @override
  Future<List<ConversationEntity>> fetchConversations() async {
    final conversationModels = await conversationsRemoteDataSource.fetchConversations();
    return conversationModels.map(ConversationMapper.toEntity).toList();
  }
}