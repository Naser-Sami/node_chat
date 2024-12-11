import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/_features.dart';

part 'contacts_state.dart';

part 'contacts_event.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final FetchContactsUseCase fetchContactsUseCase;
  final AddContactUseCase addContactUseCase;
  final CheckOrCreateConversationUseCase checkOrCreateConversationUseCase;

  ContactsBloc(
    this.fetchContactsUseCase,
    this.addContactUseCase,
    this.checkOrCreateConversationUseCase,
  ) : super(ContactsInitial()) {
    on<FetchContactsEvent>(_onFetchContacts);
    on<AddContactEvent>(_onAddContact);
    on<CheckOrCreateConversationEvent>(_onCheckOrCreateConversation);
  }

  Future<void> _onFetchContacts(FetchContactsEvent event, Emitter<ContactsState> emit) async {
    emit(ContactsLoadingState());
    try {
      final contacts = await fetchContactsUseCase.call();
      emit(ContactsLoadedState(contacts: contacts));
    } catch (e) {
      emit(ContactsErrorState(error: e.toString()));
    }
  }

  Future<void> _onAddContact(AddContactEvent event, Emitter<ContactsState> emit) async {
    emit(ContactsLoadingState());
    try {
      await addContactUseCase.call(event.contactEmail);
      emit(ContactAddedState());
      add(FetchContactsEvent());
    } catch (e) {
      emit(ContactsErrorState(error: e.toString()));
    }
  }

  Future<void> _onCheckOrCreateConversation(CheckOrCreateConversationEvent event, Emitter<ContactsState> emit) async {
    emit(ContactsLoadingState());
    try {

      final conversationId = await checkOrCreateConversationUseCase.call(event.contactId);
      emit(ConversationStartState(conversationId: conversationId, contactName: event.contactName));
      add(FetchContactsEvent());
    } catch (e) {
      emit(ContactsErrorState(error: e.toString()));
    }
  }
}
