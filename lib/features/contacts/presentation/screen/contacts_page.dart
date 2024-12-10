import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '/features/contacts/_contacts.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {

  @override
  void initState() {
    super.initState();
    context.read<ContactsBloc>().add(FetchContactsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contacts'),
        ),
        body: const ContactsBodyWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddContactDialog(context),
          child: const Icon(Icons.add),
        ));
  }

  void _showAddContactDialog(BuildContext context) {
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {

        return AlertDialog(
          title: const Text('Add Contact'),
          content: TextField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: 'Enter contact email',
            ),
            onChanged: (value) {
              // Update the contact name
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add the contact
                final email = emailController.text.trim();
                if (email.isEmpty) return;

                // Add the contact to the state
                context.read<ContactsBloc>().add(AddContactEvent(contactEmail: email));

                GoRouter.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
