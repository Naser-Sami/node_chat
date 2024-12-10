import '/core/_core.dart';
import '/features/contacts/_contacts.dart';

class ContactsRemoteDataSource {
  Future<List<ContactModel>> fetchContacts() async {
    final response = await ApiClient.get<List<ContactModel>>(
      path: "/contacts",
      parser: (data) =>
          (data as List<dynamic>).map((item) => ContactModel.fromJson(item)).toList().cast<ContactModel>(),
    );

    return response ?? [] as List<ContactModel>;
  }

  Future<void> addContact(String contactEmail) async {
    await ApiClient.post<String>(
      path: '/contacts',
      data: {'contactEmail': contactEmail},
      parser: (data) => data,
    );
  }
}
