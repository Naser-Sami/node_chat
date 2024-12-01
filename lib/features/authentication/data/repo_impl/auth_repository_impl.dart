import '/features/authentication/_authentication.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<UserEntity> login(String email, String password) async {
    final userModel = await authRemoteDataSource.login(email, password);

    // Map model to entity
    final userEntity = UserMapper.toEntity(userModel);
    return userEntity;
  }

  @override
  Future<UserEntity> register(String username, String email, String password) async {
    final userModel = await authRemoteDataSource.register(username, email, password);

    // Map model to entity
    final userEntity = UserMapper.toEntity(userModel);
    return userEntity;
  }
}
