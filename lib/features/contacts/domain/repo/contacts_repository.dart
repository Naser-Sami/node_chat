import '/features/contacts/_contacts.dart';

abstract class ContactsRepository {
  Future<List<ContactEntity>> fetchContacts();
  Future<void> addContact(String contactEmail);
}