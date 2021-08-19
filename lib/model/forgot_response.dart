class ForgotResponse {
  final bool ok;
  final String resetToken;

  ForgotResponse({required this.ok, required this.resetToken});

  factory ForgotResponse.fromJson(Map<String, dynamic> parsedJson) {
    return ForgotResponse(
      ok: parsedJson['ok'],
      resetToken: parsedJson['resetToken'],
    );
  }
}
