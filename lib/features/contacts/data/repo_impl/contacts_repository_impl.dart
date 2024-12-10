import '/features/contacts/_contacts.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  final ContactsRemoteDataSource contactsRemoteDataSource;

  ContactsRepositoryImpl(this.contactsRemoteDataSource);

  @override
  Future<void> addContact(String contactEmail) async {
    return await contactsRemoteDataSource.addContact(contactEmail);
  }

  @override
  Future<List<ContactEntity>> fetchContacts() async {
    final model = await contactsRemoteDataSource.fetchContacts();
    return model.map(ContactMapper.toEntity).toList();
  }
}