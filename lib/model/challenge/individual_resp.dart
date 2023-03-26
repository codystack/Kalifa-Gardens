class IndividualResponse {
  String? type;
  String? email;
  String? challengeId;
  String? expiresAt;

  IndividualResponse({
    required this.type,
    required this.email,
    required this.challengeId,
    required this.expiresAt,
  });

  IndividualResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    email = json['email'];
    challengeId = json['challenge_id'];
    expiresAt = json['expires_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['email'] = this.email;
    data['challenge_id'] = this.challengeId;
    data['expires_at'] = this.expiresAt;
    return data;
  }
}
