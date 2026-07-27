
import 'package:flutter/material.dart';

import '../app_theme/app_colors.dart';

class AppCircularIndicator extends StatelessWidget {
  const AppCircularIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors colors=LightColors();
    return SizedBox(height: 20,width:
    20,
      child: CircularProgressIndicator(
        color: colors.darkGrey,
        strokeWidth: 2,
      ),
    );
  }
}
