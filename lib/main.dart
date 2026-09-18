import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/Onboarding/introductionScreen.dart';
import 'package:evently_app/Onboarding/onboardingScreen1.dart';
import 'package:evently_app/home/addEvent.dart';
import 'package:evently_app/home/edit_event.dart';
import 'package:evently_app/home/event_details.dart';
import 'package:evently_app/login/loginPage.dart';
import 'package:evently_app/providers/events_provider.dart';
import 'package:evently_app/providers/language_provider.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/register/registerPage.dart';
import 'package:evently_app/utils/approutes.dart';
import 'package:evently_app/utils/apptheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'Onboarding/onboardingScreen2.dart';
import 'Onboarding/onboardingScreen3.dart';
import 'firebase_options.dart';
import 'home/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      startLocale: Locale('en'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>AppLanguageProvider()),
          ChangeNotifierProvider(create: (context)=>AppThemeProvider()),
          ChangeNotifierProvider(create: (context)=>UserProvider()),
          ChangeNotifierProvider(create: (context)=>EventsProvider()),
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
      initialRoute: AppRoutes.LoginScreen,
      routes: {
        AppRoutes.HomeScreen:(context)=>HomeScreen(),
        AppRoutes.LoginScreen:(context)=>Loginpage(),
        AppRoutes.RegisterScreen:(context)=>RegisterPage(),
        AppRoutes.IntroductionScreen:(context)=>Introductionscreen(),
        AppRoutes.OnboardingScreen1:(context)=>OnboardingScreen1(),
        AppRoutes.OnboardingScreen2:(context)=>OnboardingScreen2(),
        AppRoutes.OnboardingScreen3:(context)=>OnboardingScreen3(),
        AppRoutes.AddEvent:(context)=>AddEvent(),
        AppRoutes.EventDetailsScreen:(context)=>EventDetails(),
        AppRoutes.EditEventScreen:(context)=>EditEvent(),
      },
    );
  }
}



