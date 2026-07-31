import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/di/di.dart';
import 'core/app_theme/app_theme.dart';

void main() {


  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        theme: AppTheme.lightTheme,
         home: Scaffold()
      // BlocProvider(
      //     create: (_) => getIt<ForgetPasswordCubit>(),
      //     child: const ForgetPasswordScreen(),

      //   )
       );
  }
}
