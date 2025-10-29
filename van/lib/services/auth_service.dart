import 'package:flutter/foundation.dart';
import '../models/user_model.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  UserModel? _currentUser;
  bool _isLoggedIn = false;

  // Getters
  UserModel? get currentUser => _currentUser;
  bool get isLoggedIn => _isLoggedIn;

  /// Simulate login with email and password
  Future<AuthResult> login(String email, String password) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));

      // Simple validation for demo purposes
      if (email.isEmpty || password.isEmpty) {
        return AuthResult(
          success: false,
          message: 'Email and password are required',
        );
      }

      if (!_isValidEmail(email)) {
        return AuthResult(
          success: false,
          message: 'Please enter a valid email address',
        );
      }

      if (password.length < 6) {
        return AuthResult(
          success: false,
          message: 'Password must be at least 6 characters',
        );
      }

      // For demo purposes, accept any valid email/password combination
      // In a real app, this would validate against a backend service
      _currentUser = UserModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _extractNameFromEmail(email),
        email: email,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      _isLoggedIn = true;

      return AuthResult(
        success: true,
        message: 'Login successful',
        user: _currentUser,
      );
    } catch (e) {
      debugPrint('Login error: $e');
      return AuthResult(
        success: false,
        message: 'Login failed. Please try again.',
      );
    }
  }

  /// Simulate user registration
  Future<AuthResult> register(String name, String email, String password) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));

      // Validation
      if (name.isEmpty || email.isEmpty || password.isEmpty) {
        return AuthResult(
          success: false,
          message: 'All fields are required',
        );
      }

      if (!_isValidEmail(email)) {
        return AuthResult(
          success: false,
          message: 'Please enter a valid email address',
        );
      }

      if (password.length < 8) {
        return AuthResult(
          success: false,
          message: 'Password must be at least 8 characters',
        );
      }

      // Create new user
      _currentUser = UserModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        email: email,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      _isLoggedIn = true;

      return AuthResult(
        success: true,
        message: 'Registration successful',
        user: _currentUser,
      );
    } catch (e) {
      debugPrint('Registration error: $e');
      return AuthResult(
        success: false,
        message: 'Registration failed. Please try again.',
      );
    }
  }

  /// Simulate password reset
  Future<AuthResult> resetPassword(String email) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));

      if (!_isValidEmail(email)) {
        return AuthResult(
          success: false,
          message: 'Please enter a valid email address',
        );
      }

      return AuthResult(
        success: true,
        message: 'Password reset link sent to your email',
      );
    } catch (e) {
      debugPrint('Password reset error: $e');
      return AuthResult(
        success: false,
        message: 'Failed to send reset link. Please try again.',
      );
    }
  }

  /// Logout user
  Future<void> logout() async {
    _currentUser = null;
    _isLoggedIn = false;
    debugPrint('User logged out successfully');
  }

  /// Check if user session is valid (for auto-login)
  Future<bool> checkAuthStatus() async {
    // Simulate checking stored credentials/tokens
    await Future.delayed(const Duration(seconds: 1));
    
    // In a real app, you would check stored tokens, validate with backend, etc.
    // For demo purposes, we'll return false (no auto-login)
    return false;
  }

  /// Update user profile
  Future<AuthResult> updateProfile(UserModel updatedUser) async {
    try {
      if (!_isLoggedIn || _currentUser == null) {
        return AuthResult(
          success: false,
          message: 'User not logged in',
        );
      }

      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));

      _currentUser = updatedUser.copyWith(updatedAt: DateTime.now());

      return AuthResult(
        success: true,
        message: 'Profile updated successfully',
        user: _currentUser,
      );
    } catch (e) {
      debugPrint('Profile update error: $e');
      return AuthResult(
        success: false,
        message: 'Failed to update profile. Please try again.',
      );
    }
  }

  // Helper methods
  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  String _extractNameFromEmail(String email) {
    final username = email.split('@')[0];
    return username.split('.').map((part) => 
      part.isNotEmpty ? part[0].toUpperCase() + part.substring(1) : part
    ).join(' ');
  }
}

/// Result class for authentication operations
class AuthResult {
  final bool success;
  final String message;
  final UserModel? user;

  const AuthResult({
    required this.success,
    required this.message,
    this.user,
  });

  @override
  String toString() {
    return 'AuthResult(success: $success, message: $message, user: $user)';
  }
}
