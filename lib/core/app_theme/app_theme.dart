import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = _buildTheme(
      LightColors(), Brightness.light);


  static ThemeData _buildTheme(AppColors colors, Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: colors.background,

      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.primary,
        onPrimary: colors.white,
        secondary: colors.secondary,
        onSecondary: colors.black,
        error: colors.error,
        onError: colors.white,
        surface: colors.surface,
        onSurface: colors.textPrimary,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        foregroundColor: colors.textPrimary,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: colors.textPrimary),
        titleTextStyle: TextStyle(
          color: colors.textPrimary,
          fontSize: 28,
          fontWeight: FontWeight.w500,
        ),
      ),

      /// ----------------------- Text theme----------------------///
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: colors.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          color: colors.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: colors.textPrimary,
        ),
        bodySmall: TextStyle(
          fontSize: 13,
          color: colors.hint,
        ),
      ),

      ///--------------- text Field -------------------///
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        labelStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: colors.darkGrey,
        ),
        hintStyle: TextStyle(
          fontSize: 14,
          color: colors.hint,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: colors.border,
            width: 1.2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: colors.border,
            width: 1.2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: colors.border,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: colors.error,
            width: 1.2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: colors.error,
            width: 1.5,
          ),
        ),
      ),
      //------------------Snack Bar-------------------
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.darkGrey
        ,
        contentTextStyle: TextStyle(
          color: colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        actionTextColor: colors.primary,
      ),



      ///---------------- Elevated button ------------------------////

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      //-------------------Navigation Bar---------------------
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colors.lightBlue,
        elevation: 0,
        height: 70,
        indicatorColor: colors.blueSelected,

        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(
              color: colors.primary,
              size: 24,
            );
          }

          return IconThemeData(
            color: colors.darkGrey,
            size: 24,
          );
        }),

        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color:colors.primary,
            );
          }

          return TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: colors.darkGrey,
          );
        }),
      ),


    );
  }
}