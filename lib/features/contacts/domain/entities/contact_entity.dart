
import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable {
  final String id;
  final String username;
  final String email;

  const ContactEntity({
    required this.id,
    required this.username,
    required this.email,
  });

  // copy with
  ContactEntity copyWith({
    String? id,
    String? username,
    String? email,
  }) => ContactEntity(
    id: id ?? this.id,
    username: username ?? this.username,
    email: email ?? this.email,
  );

  // to string
  @override
  String toString() {
    return 'ContactEntity(id: $id, username: $username, email: $email)';
  }

  @override
  List<Object?> get props => [id, username, email];
}