import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/conversations/_conversations.dart';

class ConversationTileWidget extends StatelessWidget {
  const ConversationTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NeumorphismContainer(
        borderRadius: BorderRadius.circular(TRadius.bR30),
        child: Padding(
          padding: const EdgeInsets.all(TPadding.p08),
          child: BlocBuilder<ConversationsBloc, ConversationsState>(
            builder: (context, state) {
              if (state is ConversationsLoadingState) {
                return ListView(
                  children: [
                    for (int i = 0; i < 10; i++)
                      Skeletonizer.zone(
                        effect: ShimmerEffect(
                          baseColor: Theme.of(context).colorScheme.secondaryFixedDim.withOpacity(0.5),
                          highlightColor: Theme.of(context).colorScheme.tertiaryFixed.withOpacity(0.5),
                        ),
                        child: const ListTile(
                          leading: Bone.circle(size: 48),
                          title: Bone.text(words: 2),
                          subtitle: Bone.text(),
                          trailing: Bone.icon(),
                        ),
                      ),
                  ],
                );
              }

              if (state is ConversationsLoadedState) {
                if (state.conversations.isEmpty) {
                  return Center(
                    child: TextWidget(
                      'No conversations found',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: state.conversations.length,
                  itemBuilder: (context, index) {
                    final conversation = state.conversations[index];

                    return _buildMessageTile(
                      context,
                      name: conversation.participantName,
                      message: conversation.lastMessage,
                      time: conversation.lastMessageTime.fullFormatted,
                    );
                  },
                );
              }

              if (state is ConversationsErrorState) {
                return Center(
                  child: TextWidget(
                    state.message.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              }

              return const Center(
                child: Text("No conversations found!"),
              );
            },
          ),
        ),
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
}
