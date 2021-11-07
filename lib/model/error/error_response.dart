class ErrorResponse {
  final int statusCode;
  final String error;
  final String message;

  ErrorResponse({
    required this.statusCode,
    required this.error,
    required this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> parsedJson) {
    return ErrorResponse(
      statusCode: parsedJson['statusCode'],
      error: parsedJson['error'],
      message: parsedJson['message'],
    );
  }

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'error': error,
        'message': message,
      };
}
