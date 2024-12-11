import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '/features/contacts/_contacts.dart';

class ContactsBodyWidget extends StatelessWidget {
  const ContactsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc, ContactsState>(
      builder: (context, state) {
        if (state is ContactsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ContactsLoadedState) {
          return ListView.builder(
            itemCount: state.contacts.length,
            itemBuilder: (context, index) {
              final contact = state.contacts[index];

              return ListTile(
                title: Text(contact.username),
                subtitle: Text(contact.email),
                onTap: () => context.read<ContactsBloc>().add(
                      CheckOrCreateConversationEvent(
                        contactId: contact.id,
                        contactName: contact.username,
                      ),
                    ),
              );
            },
          );
        }

        if (state is ContactsErrorState) {
          return Center(
            child: Text(state.error),
          );
        }

        return const Center(
          child: Text("No contacts found"),
        );
      },
    );
  }
}
