

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:veeginine/constants/api_constants.dart';

// Custom exception classes for better error handling
class AuthException implements Exception {
  final String message;
  final int? statusCode;
  
  AuthException(this.message, [this.statusCode]);
  
  @override
  String toString() => message;
}

class NetworkException extends AuthException {
  NetworkException(String message) : super(message);
}

class ValidationException extends AuthException {
  ValidationException(String message) : super(message);
}

class AuthService {
  static const Duration _timeout = Duration(seconds: 30);

  // Helper method to handle HTTP responses
  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        return jsonDecode(response.body);
      } catch (e) {
        throw AuthException('Invalid response format from server');
      }
    } else {
      // Handle different error status codes
      String errorMessage;
      try {
        final errorResponse = jsonDecode(response.body);
        errorMessage = errorResponse['message'] ?? 'Unknown error occurred';
      } catch (e) {
        errorMessage = _getErrorMessageForStatusCode(response.statusCode);
      }
      throw AuthException(errorMessage, response.statusCode);
    }
  }

  // Get user-friendly error messages for different status codes
  String _getErrorMessageForStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Invalid request. Please check your information.';
      case 401:
        return 'Invalid credentials. Please try again.';
      case 403:
        return 'Access denied. You don\'t have permission.';
      case 404:
        return 'Service not found. Please try again later.';
      case 409:
        return 'User already exists with this information.';
      case 422:
        return 'Validation error. Please check your input.';
      case 429:
        return 'Too many requests. Please try again later.';
      case 500:
        return 'Server error. Please try again later.';
      case 503:
        return 'Service unavailable. Please try again later.';
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }

  // Helper method to handle network exceptions
  Future<T> _handleNetworkCall<T>(Future<T> Function() networkCall) async {
    try {
      return await networkCall().timeout(_timeout);
    } on SocketException {
      throw NetworkException('No internet connection. Please check your network.');
    } on TimeoutException {
      throw NetworkException('Request timeout. Please try again.');
    } on HttpException {
      throw NetworkException('Network error. Please try again.');
    } on FormatException {
      throw AuthException('Invalid data format received from server.');
    } catch (e) {
      if (e is AuthException) {
        rethrow;
      }
      throw AuthException('An unexpected error occurred: ${e.toString()}');
    }
  }

  // Validation helpers
  void _validateEmail(String email) {
    if (email.isEmpty) {
      throw ValidationException('Email is required');
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      throw ValidationException('Please enter a valid email address');
    }
  }

  void _validatePhone(String phone) {
    if (phone.isEmpty) {
      throw ValidationException('Phone number is required');
    }
    if (phone.length < 10) {
      throw ValidationException('Please enter a valid phone number');
    }
  }

  void _validateName(String name, String fieldName) {
    if (name.isEmpty) {
      throw ValidationException('$fieldName is required');
    }
    if (name.length < 2) {
      throw ValidationException('$fieldName must be at least 2 characters long');
    }
  }

  void _validatePassword(String password) {
    if (password.isEmpty) {
      throw ValidationException('Password is required');
    }
    if (password.length < 8) {
      throw ValidationException('Password must be at least 8 characters long');
    }
  }

  Future<Map<String, dynamic>> register({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    String? referalCode,
  }) async {
    return _handleNetworkCall(() async {
      // Validate inputs
      _validateName(firstName, 'First name');
      _validateName(lastName, 'Last name');
      _validatePhone(phone);
      _validateEmail(email);

      final url = Uri.parse(ApiConstants.register);

      print("hslfdljsfl$url");
      
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'firstName': firstName.trim(),
          'lastName': lastName.trim(),
          'phoneNumber': phone.trim(),
          'email': email.trim().toLowerCase(),
          'referralCode': referalCode?.trim(),
        }),
      );

      print("kljslfjkl;;${response.statusCode}");

      return _handleResponse(response);
    });
  }

  Future<Map<String, dynamic>> verifyOtp({
    required String otp,
    required String token,
  }) async {
    return _handleNetworkCall(() async {
      if (otp.isEmpty) {
        throw ValidationException('OTP is required');
      }
      // if (otp.length != 4) {
      //   throw ValidationException('Please enter a valid 6-digit OTP');
      // }
      if (token.isEmpty) {
        throw ValidationException('Invalid session. Please try registering again.');
      }

      final url = Uri.parse('${ApiConstants.baseUrl}/verify-otp');
      print(url);
      print(otp);
      print(token);
      
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'otp': otp,
          'token': token,
        }),
      );

      print("llllllll${response.statusCode}");

      return _handleResponse(response);
    });
  }

  Future<Map<String, dynamic>> setPassword({
    required String userId,
    required String password,
  }) async {
        print("kkkkkkkkkkk");

    return _handleNetworkCall(() async {
      if (userId.isEmpty) {
        throw ValidationException('User ID is required');
      }
      _validatePassword(password);


      final url = Uri.parse('${ApiConstants.baseUrl}/set-password/$userId');
      print("kkkkkkkk$url");
      
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'password': password,
        }),
      );

            print("kkkkkkkk${response.statusCode}");
                        print("kkkkkkkk${response.body}");



      return _handleResponse(response);
    });
  }

  Future<Map<String, dynamic>> login({
    required String phoneNumber,
    required String password,
  }) async {
    return _handleNetworkCall(() async {
      _validatePhone(phoneNumber);
      if (password.isEmpty) {
        throw ValidationException('Password is required');
      }

      final url = Uri.parse('${ApiConstants.baseUrl}/login');
      
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'phoneNumber': phoneNumber.trim(),
          'password': password,
        }),
      );

      return _handleResponse(response);
    });
  }

  Future<Map<String, dynamic>> resendOtp({
    required String token,
  }) async {
    return _handleNetworkCall(() async {
      if (token.isEmpty) {
        throw ValidationException('Invalid session. Please try registering again.');
      }

      final url = Uri.parse('${ApiConstants.baseUrl}/resend-otp');
      
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'token': token,
        }),
      );

      return _handleResponse(response);
    });
  }

  Future<Map<String, dynamic>> forgotPassword({
    required String phoneNumber,
  }) async {
    return _handleNetworkCall(() async {
      _validatePhone(phoneNumber);

      final url = Uri.parse('${ApiConstants.baseUrl}/forgot-password');
      
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'phoneNumber': phoneNumber.trim(),
        }),
      );

      return _handleResponse(response);
    });
  }
}