part of 'contacts_bloc.dart';

sealed class ContactsEvent extends Equatable {
  const ContactsEvent();
}

class FetchContactsEvent extends ContactsEvent {
  @override
  List<Object?> get props => [];
}

class AddContactEvent extends ContactsEvent {
  final String contactEmail;

  const AddContactEvent({required this.contactEmail});

  @override
  List<Object?> get props => [contactEmail];
}

class CheckOrCreateConversationEvent extends ContactsEvent {
  final String contactId;
  final String contactName;
  const CheckOrCreateConversationEvent({required this.contactId, required this.contactName});

  @override
  List<Object?> get props => [contactId, contactName];
}
