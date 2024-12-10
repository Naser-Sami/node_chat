part of 'contacts_bloc.dart';

sealed class ContactsState extends Equatable {
  const ContactsState();
}

final class ContactsInitial extends ContactsState {
  @override
  List<Object> get props => [];
}

class ContactsLoadingState extends ContactsState {
  @override
  List<Object> get props => [];
}

class ContactsLoadedState extends ContactsState {
  final List<ContactEntity> contacts;

  const ContactsLoadedState({required this.contacts});

  @override
  List<Object> get props => [contacts];
}

class ContactsErrorState extends ContactsState {
  final String error;

  const ContactsErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class ContactAddedState extends ContactsState {
  @override
  List<Object> get props => [];
}