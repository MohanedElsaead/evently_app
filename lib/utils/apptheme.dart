import 'package:evently_app/utils/appcolors.dart';
import 'package:evently_app/utils/appstyles.dart';
import 'package:flutter/material.dart';

class Apptheme {
  static final ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: Appcolors.LightBGColor,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Appcolors.WhiteColor,
          selectedItemColor: Appcolors.MainLightColor,
          unselectedItemColor: Appcolors.Disable,
          selectedLabelStyle: AppStyles.Regular12MainLightColor,
            unselectedLabelStyle: AppStyles.Regular12GreyColor
          ),
    cardColor: Appcolors.MainLightColor,
    dividerColor: Appcolors.StrokeWhiteColor,
      textTheme: TextTheme(
      headlineLarge: AppStyles.Semi20Black,
        headlineMedium: AppStyles.Medium16Black,
        bodyLarge: AppStyles.Regular14Gray,
        headlineSmall: AppStyles.Semi24MainLightColor,
        labelMedium: AppStyles.Medium16MainColor,
        labelSmall: AppStyles.Medium18MainColor,
        labelLarge: AppStyles.Semi14MainLightColor,
          bodyMedium: AppStyles.Semi16MainLightColor,
        bodySmall: AppStyles.Medium14Black,
        titleLarge: AppStyles.Regular14MainLightColor,
        titleMedium: AppStyles.Medium20BlackColor,
        titleSmall: AppStyles.Medium18Black,
  )
  );
  static final ThemeData darkTheme=ThemeData(
      scaffoldBackgroundColor: Appcolors.DarkBgColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Appcolors.DarkBgColor,
          selectedItemColor: Appcolors.MainDarkColor,
          unselectedItemColor: Appcolors.Disable,
          selectedLabelStyle: AppStyles.Regular12MainDarkColor,
          unselectedLabelStyle: AppStyles.Regular12GreyColor
      ),
      cardColor: Appcolors.MainDarkColor,
      dividerColor: Appcolors.MainLightColor,
      textTheme: TextTheme(
        headlineLarge: AppStyles.Semi20Black.copyWith(color: Appcolors.WhiteColor),
        headlineMedium: AppStyles.Medium16White,
        bodyLarge: AppStyles.Regular14WhiteDarkColor,
        headlineSmall: AppStyles.Semi24White,
        labelMedium: AppStyles.Medium16MainDarkColor,
        labelSmall: AppStyles.Medium18MainDarkColor,
        labelLarge: AppStyles.Semi14MainDarkColor,
        bodyMedium: AppStyles.Semi16MainDark,
        bodySmall: AppStyles.Medium14White,
        titleLarge: AppStyles.Regular14MainDarkColor,
        titleMedium: AppStyles.Medium20WhiteDarkColor,
        titleSmall: AppStyles.Medium18White,
      )
  );
}