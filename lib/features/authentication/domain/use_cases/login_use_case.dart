import '../domain.dart';

class LoginUseCase {
  final AuthRepository repo;
  LoginUseCase({required this.repo});

  Future<UserEntity> call(String email, String password) {
    return repo.login(email, password);
  }
}
