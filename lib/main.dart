import 'package:flutter/material.dart';

import 'config/di/di.dart';
import 'core/app_theme/app_theme.dart';
import 'features/profile/presentation/view/profile_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  // TODO: remove this debug token before release
  // final debugToken =
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjZhNzFmYjY0ZDJlYTA3MjY4ZmIyZmJmNSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzg1OTI1MTMxfQ.b4N3lVOAogefkFnPxWiKVR_H-jf0zWqtZvYl_U1Iat0";
  // if (debugToken.isNotEmpty && debugToken != 'YOUR_TOKEN_HERE') {
  //   await SharedPrefsUtils().saveToken(debugToken);
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.lightTheme, home: const ProfileScreen());
  }
}
