import '/features/contacts/_contacts.dart';

class FetchContactsUseCase {
  final ContactsRepository repo;

  FetchContactsUseCase(this.repo);

  Future<List<ContactEntity>> call() async {
    return await repo.fetchContacts();
  }
}