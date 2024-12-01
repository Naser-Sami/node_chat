import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String username;

  const UserEntity({
    required this.id,
    required this.email,
    required this.username,
  });

  UserEntity copyWith({
    String? id,
    String? email,
    String? username,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
    );
  }

  @override
  String toString() {
    return 'UserEntity(id: $id, email: $email, username: $username)';
  }

  @override
  List<Object?> get props => [id, email, username];
}
