import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:gpspro/domain/models/user_model.dart';
import 'package:gpspro/presentation/repository/response_models/login_response.dart';

abstract class AuthRepo {
  Future<LoginResponse> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  });

  Future<LoginResponse> login({
    required String username,
    required String password,
  });

  Future<Map<String, dynamic>> getMyProfile();
  Future<Map<String, dynamic>> uploadProfilePic(File image);

  Future<void> logout();
  Future<User> updateUser(User user);
  Future<Either<String, String>> deleteAccount(int userId);

  Future<void> requestToken({required String emailOrPhone});
  Future<String> verifyToken({required String otp, required String emailOrPhone, required String identifier});
  Future<void> resetPassword({required String token, required String newPassword});
  Future<String> initiateSignup({
    required String emailOrPhone,
  });
  Future<Either<String, String>> confirmPassword({
    required String confirmPassword,
  });
  Future<void> completeSignup({
    required String token,
    required String fullname,
    required String password,
  });
}
