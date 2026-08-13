import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/login/loginPage.dart';
import 'package:evently_app/providers/language_provider.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/register/registerPage.dart';
import 'package:evently_app/utils/approutes.dart';
import 'package:evently_app/utils/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      startLocale: Locale('en'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>AppLanguageProvider()),
          ChangeNotifierProvider(create: (context)=>AppThemeProvider())
        ],
          child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    var themeProvider=Provider.of<AppThemeProvider>(context);

    return MaterialApp(
      theme: Apptheme.lightTheme,
      darkTheme: Apptheme.darkTheme,
      themeMode: themeProvider.appTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.HomeScreen,
      routes: {
        AppRoutes.HomeScreen:(context)=>HomeScreen(),
        AppRoutes.LoginScreen:(context)=>Loginpage(),
        AppRoutes.RegisterScreen:(context)=>RegisterPage(),
      },
    );
  }
}



