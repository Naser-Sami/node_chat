import '../domain.dart';

class RegisterUseCase {
  final AuthRepository repo;
  RegisterUseCase({required this.repo});

  Future<UserEntity> call(String username, String email, String password) async {
    return repo.register(username, email, password);
  }
}
