import 'user.dart';

class LoginResponse {
  final String jwt;
  final User user;

  LoginResponse({required this.jwt, required this.user});

  factory LoginResponse.fromJson(Map<dynamic, dynamic> parsedJson) {
    return LoginResponse(
      jwt: parsedJson['jwt'],
      user: User.fromJson(parsedJson['user']),
    );
  }

  Map<String, dynamic> toJson() => {
        'jwt': jwt,
        'user': user,
      };
}
