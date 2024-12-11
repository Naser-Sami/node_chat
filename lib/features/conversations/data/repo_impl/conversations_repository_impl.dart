import '/features/conversations/_conversations.dart';

class ConversationsRepositoryImpl implements ConversationsRepository {
  final ConversationsRemoteDataSource dataSource;
  ConversationsRepositoryImpl(this.dataSource);

  @override
  Future<List<ConversationEntity>> fetchConversations() async {
    final conversationModels = await dataSource.fetchConversations();
    return conversationModels.map(ConversationMapper.toEntity).toList();
  }

  @override
  Future<String> checkOrCreateConversation(String contactId) {
    return dataSource.checkOrCreateConversation(contactId);
  }
}