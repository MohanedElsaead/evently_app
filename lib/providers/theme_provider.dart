
import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier{
  ThemeMode appTheme=ThemeMode.dark;
  bool get isDark => appTheme == ThemeMode.dark;
  void ChangeTheme(ThemeMode newTheme){
    if(appTheme==newTheme){
      return;
    }
   appTheme=newTheme;
    notifyListeners();
  }
}