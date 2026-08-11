import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/home/tabs/profile/profile_tab.dart';
import 'package:evently_app/home/theme_bottom_sheet.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/utils/appcolors.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import 'language_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    var themeProvider=Provider.of<AppThemeProvider>(context);

    context.setLocale(Locale(languageProvider.AppLanguage));
    return Scaffold(
      body: ProfileTab()
    );
  }



  void showThemeBottomSheet() {
    showModalBottomSheet(context: context,
        builder: (context)=>ThemeBottomSheet());
  }
}

