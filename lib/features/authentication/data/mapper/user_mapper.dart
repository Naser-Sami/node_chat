import '/features/authentication/_authentication.dart';

class UserMapper {
  UserMapper._();

  // Convert UserModel to UserEntity
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      email: model.email,
      username: model.username,
      token: model.token,
    );
  }

  // Convert UserEntity to UserModel (if needed, e.g., for saving data back)
  static UserModel toModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      username: entity.username,
      token: entity.token,
    );
  }
}
