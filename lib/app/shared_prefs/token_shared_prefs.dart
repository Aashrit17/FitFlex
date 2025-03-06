import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fitflex/core/error/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenSharedPrefs {
  final SharedPreferences _sharedPreferences;

  TokenSharedPrefs(this._sharedPreferences);

  Future<Either<Failure, void>> saveToken(String token) async {
    try {
      await _sharedPreferences.setString('token', token);
      return const Right(null);
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, String>> getToken() async {
    try {
      final token = _sharedPreferences.getString('token');
      return Right(token ?? '');
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }

  }

   Future<Either<Failure, void>> saveUserId(String userId) async {
    try {
      await _sharedPreferences.setString('userId', userId);
      print("Saved User ID: $userId"); // Debug log
      return const Right(null);
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  // Get user ID from SharedPreferences
  Future<Either<Failure, String>> getUserId() async {
    try {
      final userId = _sharedPreferences.getString('userId');
      if (userId == null || userId.isEmpty) {
        return const Left(SharedPrefsFailure(message: 'User ID not found.'));
      }
      print("Retrieved User ID: $userId"); // Debug log
      return Right(userId);
    } catch (e) {
      return Left(SharedPrefsFailure(message: e.toString()));
    }
  }

  Future<bool> setUser(Map<String, dynamic> user) async {
    try {
      if (user.isEmpty) {
        throw Exception("User data cannot be empty.");
      }
      String userDataString = jsonEncode(user);
      print("User data: $userDataString"); // Debug log
      await _sharedPreferences.setString('user', userDataString);
      return true;
    } catch (e) {
      print("Error saving user data: $e"); // Debug log
      return false;
    }
  }

  Future<Map<String, dynamic>?> getUser() async {
    try {
      String? userDataString = _sharedPreferences.getString('user');
      print("User data string: $userDataString"); // Debug log
      if (userDataString == null || userDataString.isEmpty) {
        return null;
      }
      Map<String, dynamic> userData = jsonDecode(userDataString);
      return userData;
    } catch (e) {
      return null;
    }
  }
 // Update user data in SharedPreferences
  Future<bool> updateUser(Map<String, dynamic> updatedUserData) async {
    print("updateUser called with data: $updatedUserData"); // Debug log
    try {
      // Retrieve the current user data
      final currentUserData = await getUser();
      print("getting user $currentUserData");

      if (currentUserData == null) {
        print("No user data found in SharedPreferences.");
        return false; // No user data found to update
      }

      // Merge old data with new updated data
      final Map<String, dynamic> updatedData = {
        ...currentUserData, // Keep existing data
        ...updatedUserData, // Overwrite with new values
      };
      print("Updated User Data to Merge: $updatedUserData");

      // Save the updated data back to SharedPreferences
      bool isUpdated = await setUser(updatedData);
      print("Is UPDATED::::: $isUpdated");
      return isUpdated;
    } catch (e) {
      print("Error updating user data: ${e.toString()}");
      return false;
    }
  }
  Future<bool> deleteUser() async {
    try {
      await _sharedPreferences.remove('user');
      return true;
    } catch (e) {
      return false;
    }
  }

}
