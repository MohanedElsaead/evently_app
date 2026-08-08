import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/utils/approutes.dart';
import 'package:flutter/material.dart';
import 'home/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      startLocale: Locale('ar'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.HomeScreen,
      routes: {
        AppRoutes.HomeScreen:(context)=>HomeScreen(),
      },
    );
  }
}



