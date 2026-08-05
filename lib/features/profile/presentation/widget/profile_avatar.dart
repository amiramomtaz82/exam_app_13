import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final double radius;
  final String? firstName;
  final String? lastName;
  final String? imageUrl;

  const ProfileAvatar({
    super.key,
    this.radius = 48,
    this.firstName,
    this.lastName,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();
    final String initials = [
      if (firstName != null && firstName!.isNotEmpty) firstName![0],
      if (lastName != null && lastName!.isNotEmpty) lastName![0],
    ].join().toUpperCase();

    return CircleAvatar(
      radius: radius,
      backgroundColor: colors.blueSelected,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null
          ? (initials.isNotEmpty
              ? Text(
                  initials,
                  style: TextStyle(
                    color: colors.primary,
                    fontSize: radius * 0.6,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : Icon(Icons.person, size: radius, color: colors.primary))
          : null,
    );
  }
}
