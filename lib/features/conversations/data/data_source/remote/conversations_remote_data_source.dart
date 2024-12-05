import '/core/_core.dart';
import '/features/conversations/_conversations.dart';

class ConversationsRemoteDataSource {
  Future<List<ConversationModel>> fetchConversations() async {
    final response = await ApiClient.get<List<ConversationModel>>(
      path: '/conversations',
      parser: (data) => data.map((item) => ConversationModel.fromJson(item)).toList(),
    );

    return response ?? [];
  }
}