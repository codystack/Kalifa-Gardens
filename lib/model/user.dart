import 'role.dart';

class User {
  final bool? confirmed;
  final bool? blocked;
  final String? id;
  final String? username;
  final String? email;
  final String? provider;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final Role? role;

  User(
      {this.confirmed,
      this.blocked,
      this.id,
      this.username,
      this.email,
      this.provider,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.role});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        confirmed: parsedJson['confirmed'],
        blocked: parsedJson['blocked'],
        id: parsedJson['_id'],
        username: parsedJson['username'],
        email: parsedJson['email'],
        provider: parsedJson['provider'],
        createdAt: parsedJson['createdAt'],
        updatedAt: parsedJson['updatedAt'],
        v: parsedJson['__v'],
        role: Role.fromJson(parsedJson['role']));
  }

  Map<String, dynamic> toJson() => {
        'blocked': blocked,
        'confirmed': confirmed,
        'createdAt': createdAt,
        'email': email,
        'id': id,
        'provider': provider,
        'role': role,
        'updatedAt': updatedAt,
        'username': username,
        '__v': v
      };
}
