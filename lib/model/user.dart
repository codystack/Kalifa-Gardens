import 'role.dart';

class User {
  final bool confirmed;
  final bool blocked;
  final String _id;
  final String username;
  final  String email;
  final String provider;
  final String createdAt;
  final String updatedAt;
  final int __v;
  final Role role;

  User(this.confirmed, this.blocked, this._id, this.username, this.email,
      this.provider, this.createdAt, this.updatedAt, this.__v, this.role);


}