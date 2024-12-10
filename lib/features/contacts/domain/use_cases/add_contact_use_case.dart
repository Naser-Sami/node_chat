import '/features/contacts/_contacts.dart';

class AddContactUseCase {
  final ContactsRepository repo;

  AddContactUseCase(this.repo);

  Future<void> call(String contactEmail) async {
    await repo.addContact(contactEmail);
  }
}