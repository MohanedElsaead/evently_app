import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier {
String AppLanguage= 'en';
bool get isEnglish => AppLanguage == "en";
void changeLanguage(String newLanguage){
  if(AppLanguage==newLanguage){
    return;
  }
  AppLanguage=newLanguage;
  notifyListeners();
}
}