import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/approutes.dart';
import 'package:flutter/material.dart';
import 'home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.HomeScreen,
      locale: Locale("ar"),
      routes: {
        AppRoutes.HomeScreen:(context)=>HomeScreen(),
      },
    );
  }
}



