import '/features/contacts/_contacts.dart';

class ContactMapper {

  // Convert ContactModel to ContactEntity
  static ContactEntity toEntity(ContactModel model) {
    return ContactEntity(
      id: model.id,
      username: model.username,
      email: model.email,
    );
  }

  // Convert ContactEntity to ContactModel (if needed, e.g., for saving data back)
  static ContactModel toModel(ContactEntity entity) {
    return ContactModel(
      id: entity.id,
      username: entity.username,
      email: entity.email,
    );
  }
}