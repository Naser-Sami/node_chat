import 'package:flutter/material.dart';

import '/core/_core.dart';
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
            TextFormFieldWidget(
              controller: TextEditingController(),
              hintText: 'Message',
              leadingIcon: Icons.camera_alt,
              trailingIcon: Icons.send,
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
