import 'package:flutter/cupertino.dart';

class BusinessTypesResponse {
  final String? name;
  final String? published_at;
  final String? createdAt;
  final String? updatedAt;
  final String? id;

  BusinessTypesResponse(
      {@required this.name,
      @required this.published_at,
      @required this.createdAt,
      @required this.updatedAt,
      @required this.id});

  factory BusinessTypesResponse.fromJson(Map<String, dynamic> json) {
    return BusinessTypesResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      published_at: json['published_at'] as String,
    );
  }
}
