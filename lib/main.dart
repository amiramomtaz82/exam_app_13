import 'package:flutter/material.dart';

import 'config/di/di.dart';
import 'core/app_theme/app_theme.dart';
import 'features/profile/presentation/view/profile_screen.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: const ProfileScreen(),
    );
  }
}
