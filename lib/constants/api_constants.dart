class ApiConstants {
  static const String baseUrl = 'https://vegie9-backend-01.onrender.com/api';

  // Auth Endpoints
  static const String register = '$baseUrl/register';
  static const String verifyOtp = '$baseUrl/verify-otp';
  static const String setPassword = '$baseUrl/set-password';
  static const String login = '$baseUrl/login';

  // Location Endpoint (reusable with userId)
  static String userLocation(String userId) => '$baseUrl/location/$userId';
}
