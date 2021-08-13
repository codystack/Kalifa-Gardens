import 'user.dart';

class LoginResponse {
  final String jwt;
  final User user;

  LoginResponse(this.jwt, this.user);

  LoginResponse.fromJson(Map<dynamic, dynamic> json)
      : jwt = json['jwt'],
        user = json['user'];

  Map<dynamic, dynamic> toJson() => {
    'jwt': jwt,
    'user': user,
  };
}