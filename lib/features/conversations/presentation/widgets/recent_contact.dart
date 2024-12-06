
import 'package:flutter/material.dart';

import '/config/_config.dart';

class RecentContactWidget extends StatelessWidget {
  const RecentContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
