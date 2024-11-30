import '../domain.dart';

class RegisterUseCase {
  final AuthRepository repo;
  RegisterUseCase({required this.repo});

  Future<UserEntity> call(String username, String email, String password) {
    return repo.register(username, email, password);
  }
}
