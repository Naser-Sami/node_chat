import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String username;
  final String token;

  const UserEntity({
    required this.id,
    required this.email,
    required this.username,
    required this.token,
  });

  UserEntity copyWith({
    String? id,
    String? email,
    String? username,
    String? token,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      token: token ?? this.token,
    );
  }

  @override
  String toString() {
    return 'UserEntity(id: $id, email: $email, username: $username, token: $token)';
  }

  @override
  List<Object?> get props => [id, email, username, token];
}
