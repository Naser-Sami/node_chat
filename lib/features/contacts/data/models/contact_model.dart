
import 'package:equatable/equatable.dart';

class ContactModel extends Equatable {
  final String id;
  final String username;
  final String email;

  const ContactModel({
    required this.id,
    required this.username,
    required this.email,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
    };
  }

  factory ContactModel.empty() {
    return const ContactModel(
      id: "",
      username: "",
      email: "",
    );
  }

  @override
  List<Object?> get props => [id, username, email];
}