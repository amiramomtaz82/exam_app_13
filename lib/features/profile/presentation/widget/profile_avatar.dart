import 'package:exam_app_13/core/app_theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final double radius;
  final String? firstName;
  final String? lastName;
  final String? imageUrl;
  final VoidCallback? onCameraTap;

  const ProfileAvatar({
    super.key,
    this.radius = 45,
    this.firstName,
    this.lastName,
    this.imageUrl,
    this.onCameraTap,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = LightColors();
    final String initials = [
      if (firstName != null && firstName!.isNotEmpty) firstName![0],
      if (lastName != null && lastName!.isNotEmpty) lastName![0],
    ].join().toUpperCase();

    return Center(
      child: SizedBox(
        width: radius * 2,
        height: radius * 2,
        child: Stack(
          children: [
            CircleAvatar(
              radius: radius,
              backgroundColor: colors.lightBlue,
              backgroundImage: imageUrl != null && imageUrl!.isNotEmpty
                  ? NetworkImage(imageUrl!)
                  : null,
              child: imageUrl == null || imageUrl!.isEmpty
                  ? (initials.isNotEmpty
                      ? Text(
                          initials,
                          style: TextStyle(
                            color: colors.primary,
                            fontSize: radius * 0.5,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : Icon(Icons.person, size: radius * 0.8, color: colors.primary))
                  : null,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: onCameraTap,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: colors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: colors.white, width: 1.5),
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 15,
                    color: colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
