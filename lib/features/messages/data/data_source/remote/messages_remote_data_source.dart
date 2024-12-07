import 'dart:developer';

import '/core/_core.dart';
import '/features/messages/_messages.dart';

class MessagesRemoteDataSource {
  Future<List<MessageModel>> fetchMessages(String conversationId) async {
    final response = await ApiClient.get<List<MessageModel>>(
      path: '/messages',
      queryParameters: {'conversationId': conversationId},
      parser: (data) {
        final result = (data as List<dynamic>)
            .map((item) => MessageModel.fromJson(item))
            .toList()
            .cast<MessageModel>(); // Explicitly cast to List<ConversationModel>
        log('Response result: $result');
        return result;
      },
    );

    return response ?? [] as List<MessageModel>;
  }
}
