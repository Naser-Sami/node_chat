import '/core/_core.dart';
import '/features/authentication/_authentication.dart';

class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password) async {
    final user = await ApiClient.post<UserModel>(
      path: '/auth/login',
      parser: (data) => UserModel.fromJson(data['user']),
      data: {"email": email, "password": password},
    );

    return user ?? UserModel.empty();
  }

  Future<UserModel> register(String username, String email, String password) async {
    final user = await ApiClient.post<UserModel>(
      path: '/auth/register',
      parser: (data) {
        return UserModel.fromJson(data['user']);
      },
      // token: ,
      data: {"username": username, "email": email, "password": password},
    );

    return user ?? UserModel.empty();
  }
}
