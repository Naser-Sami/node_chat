import 'package:flutter/material.dart';

import '/config/_config.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const TextWidget('Messages'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TPadding.p16),
            child: TextWidget(
              "Recent",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: TPadding.p08),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return _buildRecentContact(context, name: 'John Doe');
                },
              ),
            ),
          ),
          const SizedBox(height: TSize.s16),
          Expanded(
            child: NeumorphismContainer(
              borderRadius: BorderRadius.circular(TRadius.bR30),
              child: Padding(
                padding: const EdgeInsets.all(TPadding.p08),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return _buildMessageTile(
                      context,
                      name: 'Danny I',
                      message: 'Hello, how are you?',
                      time: '09:41',
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageTile(
    BuildContext context, {
    required String name,
    required String message,
    required String time,
  }) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
          'https://via.placeholder.com/150',
        ),
      ),
      title: TextWidget(
        name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: TextWidget(
        message,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: TextWidget(
        time,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }

  Widget _buildRecentContact(
    BuildContext context, {
    required String name,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TPadding.p10),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'https://via.placeholder.com/150',
            ),
          ),
          const SizedBox(height: 10),
          TextWidget(
            name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
