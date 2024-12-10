import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/messages/_messages.dart';

class ChatPage extends StatefulWidget {
  final String conversationId;
  final String mate;

  const ChatPage({super.key, required this.conversationId, required this.mate});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final TextEditingController _messageController;
  final _storage = const FlutterSecureStorage();
  String userId = '';

  @override
  void initState() {
    super.initState();

    _messageController = TextEditingController();
    context.read<MessagesBloc>().add(
          LoadMessagesEvent(conversationId: widget.conversationId),
        );
    fetchUserId();
  }

  void fetchUserId() async {
    final userId = await _storage.read(key: 'userId');
    setState(() {
      this.userId = userId!;
    });
  }

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      context.read<MessagesBloc>().add(
            SendMessageEvent(
              conversationId: widget.conversationId,
              content: message,
            ),
          );

      _messageController.clear();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: BackButton(
          onPressed: () => context.pop(),
        ),
        centerTitle: false,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                'https://via.placeholder.com/150',
              ),
            ),
            TSize.s16.toWidth,
            TextWidget(widget.mate),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: TPadding.p08,
                  vertical: TPadding.p24,
                ),
                child: BlocBuilder<MessagesBloc, MessagesState>(
                  builder: (context, state) {
                    if (state is MessagesLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is MessagesErrorState) {
                      return Center(
                        child: Text(state.message),
                      );
                    }

                    if (state is MessagesLoadedState) {
                      return ListView.builder(
                        itemCount: state.messages.length,
                        itemBuilder: (context, index) {
                          final message = state.messages[index];
                          final isSenderMessage = message.senderId == userId;

                          if (isSenderMessage) {
                            return _buildSendMessage(
                              context,
                              message: message.content,
                            );
                          } else {
                            return _buildReceiveMessage(
                              context,
                              message: message.content,
                            );
                          }
                        },
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
            TextFormFieldWidget(
              controller: _messageController,
              hintText: 'Message',
              leadingIcon: Icons.camera_alt,
              trailingIcon: Icons.send,
              onTrailingIconPressed: _sendMessage,
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildReceiveMessage(BuildContext context, {required String message}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(TPadding.p08),
        child: NeumorphismContainer(
          inset: false,
          blurRadius: 12,
          surfaceColor: Theme.of(context).colorScheme.surfaceDim,
          borderRadius: BorderRadius.circular(TPadding.p12),
          child: Padding(
            padding: const EdgeInsets.all(TPadding.p12),
            child: TextWidget(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSendMessage(BuildContext context, {required String message}) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(TPadding.p08),
        child: NeumorphismContainer(
          surfaceColor: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(TPadding.p12),
          child: Padding(
            padding: const EdgeInsets.all(TPadding.p12),
            child: TextWidget(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
