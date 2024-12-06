
import 'package:flutter/material.dart';

import '../widgets/_widgets.dart';
import '/config/_config.dart';

class ConversationsBodyWidget extends StatelessWidget {
  const ConversationsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: TPadding.p16),
          child: TextWidget(
            "Recent",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const RecentContactWidget(),
        const SizedBox(height: TSize.s16),
        const ConversationTileWidget(),
      ],
    );
  }
}
