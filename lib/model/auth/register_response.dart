import 'package:kalifa_gardens/model/user.dart';

class RegisterResponse {
  late String jwt;
  late User user;
  Profile? profile;

  RegisterResponse({
    required this.jwt,
    required this.user,
    required this.profile,
  });

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    jwt = json['jwt'];
    user = (json['user'] != null ? new User.fromJson(json['user']) : null)!;
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jwt'] = this.jwt;
    data['user'] = this.user.toJson();
    if (this.profile != null) {
      data['profile'] = this.profile?.toJson();
    }
    return data;
  }
}

class Profile {
  late int id;
  String? accountType;
  String? name;
  String? phoneNumber;
  String? website;
  bool? acceptedTerms;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  int? userId;

  Profile({
    required this.id,
    required this.accountType,
    required this.name,
    required this.phoneNumber,
    required this.website,
    required this.acceptedTerms,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.userId,
  });

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountType = json['account_type'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    website = json['website'];
    acceptedTerms = json['accepted_terms'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    publishedAt = json['publishedAt'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['account_type'] = this.accountType;
    data['name'] = this.name;
    data['phone_number'] = this.phoneNumber;
    data['website'] = this.website;
    data['accepted_terms'] = this.acceptedTerms;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['publishedAt'] = this.publishedAt;
    data['user_id'] = this.userId;
    return data;
  }
}
