import 'package:flutter/material.dart';
import 'package:node_chat/core/utils/extensions/extensions_on_widgets.dart';

import '/config/_config.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            const TextWidget('Danny I'),
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
                child: ListView(
                  children: [
                    _buildReceiveMessage(
                      context,
                      message: 'Hello, how are you?',
                    ),
                    _buildSendMessage(
                      context,
                      message: 'I am fine, thank you.',
                    ),
                    _buildSendMessage(
                      context,
                      message: 'What about you?',
                    ),
                    _buildReceiveMessage(
                      context,
                      message: 'I am fine, thank you.',
                    ),
                  ],
                ),
              ),
            ),
            _buildMessageInput(context),
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

  Widget _buildMessageInput(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(TPadding.p24),
      padding: const EdgeInsets.symmetric(horizontal: TPadding.p16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(TRadius.bR30),
        border: Border.all(
          color: Theme.of(context).colorScheme.scrim,
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.camera_alt,
              color: Colors.grey,
            ),
          ),
          TSize.s10.toWidth,
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Message',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          TSize.s10.toWidth,
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.send,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
