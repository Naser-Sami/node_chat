import '/core/_core.dart';
import '/features/authentication/_authentication.dart';

class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password) async {
    final user = await ApiClient.post<UserModel>(
      path: '/user/login',
      parser: (data) => UserModel.fromJson(data),
      data: {"email": email, "password": password},
    );

    return user ?? UserModel.empty();
  }

  Future<UserModel> register(String username, String email, String password) async {
    final user = await ApiClient.post<UserModel>(
      path: '/user/register',
      parser: (data) => UserModel.fromJson(data),
      data: {"username": username, "email": email, "password": password},
    );

    return user ?? UserModel.empty();
  }
}
