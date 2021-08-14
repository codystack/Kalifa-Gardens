
class OTPResponse {
  final String id;
  OTPResponse(this.id);

  OTPResponse.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'];

  Map<dynamic, dynamic> toJson() => {
    'id': id,
  };
}