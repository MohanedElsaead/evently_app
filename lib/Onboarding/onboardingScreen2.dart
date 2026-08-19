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

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    var width=context.width;
    var height=context.height;
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon:Icon(Icons.arrow_back_ios_new_outlined,color: themeProvider.isDark?Appcolors.WhiteColor:Appcolors.StrokeDarkColor,),),
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
                Row(
                  spacing: width*0.1,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                  ],
                ),
                Image.asset(themeProvider.isDark?"assets/onboarding/illustration2-dark.png":"assets/onboarding/illustration2.png"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: height*0.03,
                  children: [
                    Text("effortless Event Planning".tr(),style: Theme.of(context).textTheme.headlineLarge,),
                    Text("take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.".tr(),style: Theme.of(context).textTheme.bodyLarge,),
                    Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButton(onPressed: (){
                            Navigator.of(context).pushNamed(AppRoutes.OnboardingScreen3);
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

