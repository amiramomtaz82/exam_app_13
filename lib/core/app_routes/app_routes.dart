
import 'package:exam_app_13/features/subject/presentation/view_model/subject_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/di/di.dart';
import '../../features/auth/presentation/login/view/login_screen.dart';
import '../../features/auth/presentation/register/view/register_screen.dart';
import '../../features/subject/presentation/view/subject_screen.dart';
import '../../features/subject/presentation/view_model/subject_cubit.dart';



abstract final class AppRoutes {

  static MaterialPageRoute get login =>
      MaterialPageRoute(builder: (_) => LoginScreen());

  static MaterialPageRoute get register =>
      MaterialPageRoute(builder: (_) => RegisterScreen());


}
