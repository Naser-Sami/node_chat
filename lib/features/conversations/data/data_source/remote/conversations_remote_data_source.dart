import 'dart:developer';

import '/core/_core.dart';
import '/features/conversations/_conversations.dart';

class ConversationsRemoteDataSource {
  Future<List<ConversationModel>> fetchConversations() async {
    final response = await ApiClient.get<List<ConversationModel>>(
      path: '/conversations',
      parser: (data) {
        final result = (data as List<dynamic>)
            .map((item) => ConversationModel.fromJson(item))
            .toList()
            .cast<ConversationModel>(); // Explicitly cast to List<ConversationModel>
        log('Response result: $result');
        return result;
      },
    );

    return response ?? [] as List<ConversationModel>;
  }
}