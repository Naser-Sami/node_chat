import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String username;
  final String token;

  const UserModel({
    required this.id,
    required this.email,
    required this.username,
    this.token = "",
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      token: json['token'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'token': token,
    };
  }

  factory UserModel.empty() {
    return const UserModel(
      id: "",
      email: "",
      username: "",
      token: "",
    );
  }

  @override
  List<Object?> get props => [id, email, username, token];
}
