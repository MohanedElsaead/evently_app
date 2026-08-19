import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';
import '../utils/approutes.dart';
import '../utils/size_utils.dart';
import '../widgets/custom_elevated_button.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    var width=context.width;
    var height=context.height;
    var themeProvider=Provider.of<AppThemeProvider>(context);
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Image.asset(themeProvider.isDark?"assets/images/SmallLogoDark.png":"assets/images/SmallLogoLight.png"),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              Navigator.of(context).pushReplacementNamed(AppRoutes.HomeScreen);
            },
              child: Text("skip".tr(),style:TextStyle(color: themeProvider.isDark?Appcolors.WhiteColor:Appcolors.StrokeDarkColor)),
              style: ElevatedButton.styleFrom(backgroundColor: themeProvider.isDark?Appcolors.InputsD:Appcolors.WhiteColor,side: BorderSide(color: themeProvider.isDark?Appcolors.StrokeDarkColor:Appcolors.StrokeWhiteColor)),
            ),
          )
        ],
      ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: height*0.03,
              children: [
                Image.asset(themeProvider.isDark?"assets/onboarding/illusration1-dark.png":"assets/onboarding/illustration1.png"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: height*0.03,
                  children: [
                    Text("find Events That Inspire You".tr(),style: Theme.of(context).textTheme.headlineLarge,),
                    Text("dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.".tr(),style: Theme.of(context).textTheme.bodyLarge,),
                    Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButton(onPressed: (){
                            Navigator.of(context).pushNamed(AppRoutes.OnboardingScreen2);
                          }, child:
                          Text("Next".tr(),style: Theme.of(context).textTheme.displayMedium),
                            backgroundColor: Theme.of(context).cardColor,
                            verticalPadding: height*0.02,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

