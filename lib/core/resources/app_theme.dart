import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c17/core/resources/colors_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.lightPrimaryColor,
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        color: ColorsManager.lightSecondaryColor,
        fontWeight: FontWeight.w500
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: ColorsManager.lightPrimaryColor,
      secondary: ColorsManager.lightSecondaryColor,
      onSecondary: ColorsManager.greyColor,
      onPrimaryContainer: Colors.white
    ),
    dividerTheme: DividerThemeData(
      color: Colors.white,
      thickness: 1.h,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: ColorsManager.lightSecondaryColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.w700
      ),
      labelMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.greyColor
    )
    )
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.darkPrimaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 20.sp,
            color: ColorsManager.darkSecondaryColor,
            fontWeight: FontWeight.w500
        ),
      ),
      colorScheme: ColorScheme.light(
          primary: ColorsManager.darkPrimaryColor,
          secondary: ColorsManager.darkSecondaryColor,
          onSecondary: ColorsManager.greyColor,
          onPrimaryContainer: Colors.black
      ),
      dividerTheme: DividerThemeData(
        color: Colors.white,
        thickness: 1.h,
      ),
      textTheme: TextTheme(
          headlineMedium: TextStyle(
              color: ColorsManager.darkSecondaryColor,
              fontSize: 24.sp,
              fontWeight: FontWeight.w700
          ),
          labelMedium: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black
          ),
        labelSmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.greyColor
        )
      )
  );
}