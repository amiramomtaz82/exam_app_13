import 'package:flutter/material.dart';


abstract class AppColors {
  Color get primary;

  Color get secondary;

  Color get error;

  Color get success;
  Color get lightGreen;
  Color get lightRed;

  Color get black;

  Color get white;

  Color get grey;

  Color get darkGrey;

  Color get background;

  Color get surface;

  Color get textPrimary;

  Color get textSecondary;

  Color get border;

  Color get hint;

  Color get lightBlue;

  Color get blueSelected;

  Color get bluePin;
}


 class LightColors implements AppColors {
  @override
 Color get primary => const Color(0xff02369C);

  @override
  Color get secondary => const Color(0xffA6A6A6);

  @override
  Color get error => const Color(0xFFCC1010);

  @override
  Color get success => const Color(0xFF1E9E45);

  Color get bluePin => const Color(0xFFDFE7F7);

  @override
  Color get black => const Color(0xff0F0F0F);

  @override
  Color get white => const Color(0xffF9F9F9);

  @override
  Color get grey => const Color(0xffA6A6A6);

  @override
  Color get darkGrey => const Color(0xff878787);

  @override
  Color get background => white;

  @override
  Color get surface => white;

  @override
  Color get textPrimary => black;

  @override
  Color get textSecondary => darkGrey;

  @override
  Color get border => black;

  @override
  Color get hint => grey;

  @override
  // TODO: implement blueSelected
  Color get blueSelected => const Color(0xffCCD7EB);

  @override
  // TODO: implement lightBlue
  Color get lightBlue => const Color(0xffEDEFF3);

  @override
  // TODO: implement lightGreen
  Color get lightGreen => const Color(0xffCAF9CC);

  @override
  // TODO: implement lightRed
  Color get lightRed => const Color(0xffF8D2D2);

}