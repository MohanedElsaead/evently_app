import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/providers/language_provider.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/utils/appcolors.dart';
import 'package:evently_app/utils/approutes.dart';
import 'package:evently_app/widgets/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/size_utils.dart';

class Introductionscreen extends StatefulWidget {
  Introductionscreen({super.key});

  @override
  State<Introductionscreen> createState() => _IntroductionscreenState();
}

class _IntroductionscreenState extends State<Introductionscreen> {
  @override
  Widget build(BuildContext context) {
    var width=context.width;
    var height=context.height;
    var themeProvider=Provider.of<AppThemeProvider>(context);
    var languageProvider=Provider.of<AppLanguageProvider>(context);

    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: height*0.03,
          children: [
            Image.asset(themeProvider.isDark?"assets/images/SmallLogoDark.png":"assets/images/SmallLogoLight.png"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: height*0.02,
              children: [
              Image.asset(themeProvider.isDark?"assets/onboarding/being-creative-dark.png":"assets/onboarding/being-creative1.png"),
              Text("personalize Your Experience".tr(),style: Theme.of(context).textTheme.headlineLarge,textAlign: TextAlign.start,),
              Text("choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.".tr(),style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.start,),
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("language".tr(),style: Theme.of(context).textTheme.headlineMedium,),
                Row(
                  spacing: width*0.02,
                  children: [
                    ElevatedButton(onPressed: (){
                      languageProvider.changeLanguage("en");
                      context.setLocale(Locale("en"));
                    },
                        child: Text("english".tr(),style: languageProvider.isEnglish?Theme.of(context).textTheme.displayMedium:Theme.of(context).textTheme.titleLarge,),
                      style: ElevatedButton.styleFrom(backgroundColor: languageProvider.isEnglish?Theme.of(context).cardColor:Theme.of(context).canvasColor,),
                    ),
                    ElevatedButton(onPressed: (){
                      languageProvider.changeLanguage("ar");
                      context.setLocale(Locale("ar"));
                    },
                      child: Text("arabic".tr(),style: languageProvider.isEnglish?Theme.of(context).textTheme.titleLarge:Theme.of(context).textTheme.displayMedium),
                      style: ElevatedButton.styleFrom(backgroundColor: languageProvider.isEnglish?Theme.of(context).canvasColor:Theme.of(context).cardColor,),
                    )
                  ],
                )
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("theme".tr(),style: Theme.of(context).textTheme.headlineMedium,),
                Row(
                  spacing: width*0.02,
                  children: [
                    ElevatedButton(onPressed: (){
                      themeProvider.ChangeTheme(ThemeMode.light);
                    },
                      child: Icon(Icons.sunny,color: themeProvider.isDark?Appcolors.MainDarkColor:Appcolors.WhiteColor,),
                      style: ElevatedButton.styleFrom(backgroundColor: themeProvider.isDark?Theme.of(context).canvasColor:Theme.of(context).cardColor,),
                    ),
                    ElevatedButton(onPressed: (){
                      themeProvider.ChangeTheme(ThemeMode.dark);
                    },
                      child: Icon(Icons.nightlight,color: themeProvider.isDark?Appcolors.WhiteColor:Appcolors.MainDarkColor,),
                      style: ElevatedButton.styleFrom(backgroundColor: themeProvider.isDark?Theme.of(context).cardColor:Theme.of(context).canvasColor,),
                    )
                  ],
                )
              ],),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(onPressed: (){
                    Navigator.of(context).pushReplacementNamed(AppRoutes.OnboardingScreen1);
                  }, child:
                  Text("let’s start".tr(),style: Theme.of(context).textTheme.displayMedium),
                    backgroundColor: Theme.of(context).cardColor,
                    verticalPadding: height*0.02,
                  ),
                ),
              ],
            )

          ],
        ),
      )),
    );
  }
}
