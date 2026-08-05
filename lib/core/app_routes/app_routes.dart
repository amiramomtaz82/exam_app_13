import 'package:flutter/material.dart';
import 'package:exam_app_13/features/profile/presentation/view/edit_profile_screen.dart';
import 'package:exam_app_13/features/profile/presentation/view/profile_screen.dart';
import 'package:exam_app_13/features/profile/presentation/view/reset_password_screen.dart';

abstract final class AppRoutes {
  static Route<dynamic> profile() {
    return MaterialPageRoute(builder: (_) => const ProfileScreen());
  }

  static Route<dynamic> editProfile({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) {
    return MaterialPageRoute(
      builder: (_) => EditProfileScreen(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
      ),
    );
  }

  static Route<dynamic> resetPassword() {
    return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
  }
}
