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