import 'package:http_interceptor/http_interceptor.dart';

class ExpiredTokenRetryPolicy extends RetryPolicy {
  @override
  int get maxRetryAttempts => 5;

  @override
  bool shouldAttemptRetryOnException(Exception reason) {
    print(reason);

    return false;
  }

  @override
  Future<bool> shouldAttemptRetryOnResponse(ResponseData response) async {
    if (response.statusCode == 401) {
      print("Retrying request example here!...");
      // final cache = await SharedPreferences.getInstance();

      // cache.setString(appToken, OPEN_WEATHER_API_KEY);

      return true;
    }

    return false;
  }
}
