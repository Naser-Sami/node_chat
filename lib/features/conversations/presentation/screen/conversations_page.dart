import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../controllers/_controllers.dart';
import '../widgets/_widgets.dart';

import '/config/_config.dart';

class ConversationsPage extends StatefulWidget {
  const ConversationsPage({super.key});

  @override
  State<ConversationsPage> createState() => _ConversationsPageState();
}

class _ConversationsPageState extends State<ConversationsPage> {
  @override
  void initState() {
    super.initState();
    context.read<ConversationsBloc>().add(FetchConversationsEvent());
  }

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
      body: const ConversationsBodyWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push('/ContactsPage');
        },
        child: const Icon(Icons.contact_page_outlined),
      ),
    );
  }
}
