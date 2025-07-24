


import 'package:flutter/material.dart';
import 'package:veeginine/helper/storage_helper.dart';
import 'package:veeginine/helper/toast_helper.dart';
import 'package:veeginine/models/user_model.dart';
import 'package:veeginine/services/auth_service.dart';
import 'package:veeginine/views/create_password.dart';
import 'package:veeginine/views/login_screen.dart';
import 'package:veeginine/views/main_screen.dart';
import 'package:veeginine/views/otp_screen.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _token;
  String? get token => _token;

  User? _currentUser;
  User? get currentUser => _currentUser;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String? error) {
    _errorMessage = error;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    String? referalCode,
    required BuildContext context,
  }) async {
    try {
      _setLoading(true);
      _setError(null);

      final response = await _authService.register(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        email: email,
        referalCode: referalCode,
      );

      // Store the token for OTP verification
      _token = response['token'];

      // Show success message
      ToastHelper.showSuccessToast('Registration successful! Please verify your OTP.');

      // Navigate to OTP screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => OTPVerificationScreen()),
      );
    } on ValidationException catch (e) {
      _setError(e.message);
      ToastHelper.showErrorToast(e.message);
    } on NetworkException catch (e) {
      _setError(e.message);
      ToastHelper.showErrorToast(e.message);
    } on AuthException catch (e) {
      _setError(e.message);
      ToastHelper.showErrorToast(e.message);
    } catch (e) {
      final errorMessage = 'Registration failed: ${e.toString()}';
      _setError(errorMessage);
      ToastHelper.showErrorToast(errorMessage);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> login({
    required String phoneNumber,
    required String password,
    required bool rememberMe,
    required BuildContext context,
  }) async {
    try {
      _setLoading(true);
      _setError(null);

      final response = await _authService.login(
        phoneNumber: phoneNumber,
        password: password,
      );

      // Create user object from response
      _currentUser = User.fromJson(response['user']);

      // Save user data to SharedPreferences
      await UserPreferences.saveUser(_currentUser!);

      // Save remember me preference
      await UserPreferences.saveRememberMe(rememberMe);

      if (rememberMe) {
        await UserPreferences.savePhoneNumber(phoneNumber);
        await UserPreferences.savePassword(password);
      }

      // Show success message
      ToastHelper.showSuccessToast(
        response['message'] ?? 'Login successful!',
      );

      // Navigate to home screen
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => MainScreen()),
        (route) => false,
      );
    } on ValidationException catch (e) {
      _setError(e.message);
      ToastHelper.showErrorToast(e.message);
    } on NetworkException catch (e) {
      _setError(e.message);
      ToastHelper.showErrorToast(e.message);
    } on AuthException catch (e) {
      _setError(e.message);
      ToastHelper.showErrorToast(e.message);
    } catch (e) {
      final errorMessage = 'Login failed: ${e.toString()}';
      _setError(errorMessage);
      ToastHelper.showErrorToast(errorMessage);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      _setLoading(true);
      _setError(null);

      // Clear user data from SharedPreferences
      await UserPreferences.clearUserData();

      // Clear current user and token
      _currentUser = null;
      _token = null;

      ToastHelper.showSuccessToast('Logged out successfully');

      // Navigate to login screen
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/login',
        (route) => false,
      );
    } catch (e) {
      final errorMessage = 'Logout failed: ${e.toString()}';
      _setError(errorMessage);
      ToastHelper.showErrorToast(errorMessage);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> checkLoginStatus() async {
    try {
      if (UserPreferences.isLoggedIn()) {
        _currentUser = UserPreferences.getUser();
        notifyListeners();
      }
    } catch (e) {
      _setError('Failed to check login status: ${e.toString()}');
    }
  }

  Future<void> verifyOtp({
    required String otp,
    required BuildContext context,
  }) async {
    if (_token == null) {
      final errorMessage = 'Session expired. Please register again.';
      _setError(errorMessage);
      ToastHelper.showErrorToast(errorMessage);
      return;
    }

    try {
      _setLoading(true);
      _setError(null);

      final response = await _authService.verifyOtp(
        otp: otp,
        token: _token!,
      );

      ToastHelper.showSuccessToast('OTP verified successfully!');

      // Navigate to CreatePassword screen with userId
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => CreatePassword(userId: response['userId']),
        ),
      );
    } on ValidationException catch (e) {
      _setError(e.message);
      ToastHelper.showErrorToast(e.message);
    } on NetworkException catch (e) {
      _setError(e.message);
      ToastHelper.showErrorToast(e.message);
    } on AuthException catch (e) {
      _setError(e.message);
      ToastHelper.showErrorToast(e.message);
    } catch (e) {
      final errorMessage = 'OTP verification failed: ${e.toString()}';
      _setError(errorMessage);
      ToastHelper.showErrorToast(errorMessage);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> setPassword({
    required String userId,
    required String password,
    required BuildContext context,
  }) async {
    try {
      _setLoading(true);
      _setError(null);

          print("pppppppp");


      await _authService.setPassword(
        userId: userId,
        password: password,
      );


          print("ffffffff");


      ToastHelper.showSuccessToast('Password created successfully!');

      // Navigate to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
        ),
      );
    } on ValidationException catch (e) {
      _setError(e.message);
      ToastHelper.showErrorToast(e.message);
    } on NetworkException catch (e) {
      _setError(e.message);
      ToastHelper.showErrorToast(e.message);
    } on AuthException catch (e) {
      _setError(e.message);
      ToastHelper.showErrorToast(e.message);
    } catch (e) {
      final errorMessage = 'Password creation failed: ${e.toString()}';
      _setError(errorMessage);
      ToastHelper.showErrorToast(errorMessage);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> resendOtp(BuildContext context) async {
    if (_token == null) {
      final errorMessage = 'Session expired. Please register again.';
      _setError(errorMessage);
      ToastHelper.showErrorToast(errorMessage);
      return;
    }

    try {
      _setLoading(true);
      _setError(null);

      await _authService.resendOtp(token: _token!);

      ToastHelper.showSuccessToast('OTP resent successfully!');
    } on ValidationException catch (e) {
      _setError(e.message);
      ToastHelper.showErrorToast(e.message);
    } on NetworkException catch (e) {
      _setError(e.message);
      ToastHelper.showErrorToast(e.message);
    } on AuthException catch (e) {
      _setError(e.message);
      ToastHelper.showErrorToast(e.message);
    } catch (e) {
      final errorMessage = 'Failed to resend OTP: ${e.toString()}';
      _setError(errorMessage);
      ToastHelper.showErrorToast(errorMessage);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> forgotPassword({
    required String phoneNumber,
    required BuildContext context,
  }) async {
    try {
      _setLoading(true);
      _setError(null);

      await _authService.forgotPassword(phoneNumber: phoneNumber);

      ToastHelper.showSuccessToast('Password reset instructions sent!');
    } on ValidationException catch (e) {
      _setError(e.message);
      ToastHelper.showErrorToast(e.message);
    } on NetworkException catch (e) {
      _setError(e.message);
      ToastHelper.showErrorToast(e.message);
    } on AuthException catch (e) {
      _setError(e.message);
      ToastHelper.showErrorToast(e.message);
    } catch (e) {
      final errorMessage = 'Failed to reset password: ${e.toString()}';
      _setError(errorMessage);
      ToastHelper.showErrorToast(errorMessage);
    } finally {
      _setLoading(false);
    }
  }
}