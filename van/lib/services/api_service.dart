import 'package:flutter/foundation.dart';
import '../models/user_model.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  // HTTP Client would be initialized here
  // For now, we'll simulate API calls

  Future<List<UserModel>> getUsers() async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Simulate API response
      final mockResponse = [
        {
          'id': '1',
          'name': 'John Doe',
          'email': 'john.doe@example.com',
          'profileImageUrl': null,
          'createdAt': DateTime.now().subtract(const Duration(days: 30)).toIso8601String(),
          'updatedAt': DateTime.now().toIso8601String(),
        },
        {
          'id': '2',
          'name': 'Jane Smith',
          'email': 'jane.smith@example.com',
          'profileImageUrl': 'https://example.com/avatar.jpg',
          'createdAt': DateTime.now().subtract(const Duration(days: 15)).toIso8601String(),
          'updatedAt': DateTime.now().toIso8601String(),
        },
      ];

      return mockResponse.map((json) => UserModel.fromJson(json)).toList();
    } catch (e) {
      debugPrint('Error fetching users: $e');
      throw ApiException('Failed to fetch users: $e');
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Simulate API response
      final mockResponse = {
        'id': id,
        'name': 'User $id',
        'email': 'user$id@example.com',
        'profileImageUrl': null,
        'createdAt': DateTime.now().subtract(const Duration(days: 10)).toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      };

      return UserModel.fromJson(mockResponse);
    } catch (e) {
      debugPrint('Error fetching user: $e');
      throw ApiException('Failed to fetch user: $e');
    }
  }

  Future<UserModel> createUser(UserModel user) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 800));
      
      // Simulate successful creation
      final createdUser = user.copyWith(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      return createdUser;
    } catch (e) {
      debugPrint('Error creating user: $e');
      throw ApiException('Failed to create user: $e');
    }
  }

  Future<UserModel> updateUser(UserModel user) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 600));
      
      // Simulate successful update
      final updatedUser = user.copyWith(
        updatedAt: DateTime.now(),
      );

      return updatedUser;
    } catch (e) {
      debugPrint('Error updating user: $e');
      throw ApiException('Failed to update user: $e');
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 400));
      
      // Simulate successful deletion
      debugPrint('User $id deleted successfully');
    } catch (e) {
      debugPrint('Error deleting user: $e');
      throw ApiException('Failed to delete user: $e');
    }
  }
}

class ApiException implements Exception {
  final String message;
  
  const ApiException(this.message);
  
  @override
  String toString() => 'ApiException: $message';
}
