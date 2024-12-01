import '/features/authentication/_authentication.dart';

class UserMapper {
  // Convert UserModel to UserEntity
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      email: model.email,
      username: model.username,
    );
  }

  // Convert UserEntity to UserModel (if needed, e.g., for saving data back)
  static UserModel toModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      username: entity.username,
    );
  }
}