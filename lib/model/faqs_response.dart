import 'package:flutter/cupertino.dart';

class FAQsResponse {
  final String? id;
  final String? question;
  final String? answer;
  final String? createdAt;
  final String? updatedAt;
  final String? published_at;

  FAQsResponse(
      {@required this.id,
      @required this.question,
      @required this.answer,
      @required this.createdAt,
      @required this.updatedAt,
      @required this.published_at});

  factory FAQsResponse.fromJson(Map<String, dynamic> json) {
    return FAQsResponse(
      id: json['id'],
      question: json['question'] as String,
      answer: json['answer'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      published_at: json['published_at'] as String,
    );
  }
}
