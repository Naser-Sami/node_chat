import '../domain.dart';

class LoginUseCase {
  final AuthRepository repo;
  LoginUseCase({required this.repo});

  Future<UserEntity> call(String email, String password) async {
    return repo.login(email, password);
  }
}
