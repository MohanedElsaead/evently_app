import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/providers/language_provider.dart';
import 'package:evently_app/utils/appcolors.dart';
import 'package:evently_app/utils/appstyles.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.width*0.04,
        vertical: context.height*0.02,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: context.height*0.04,
        children: [
          InkWell(
            onTap: (){
              themeProvider.ChangeTheme(ThemeMode.dark);
            },
            child: themeProvider.appTheme==ThemeMode.dark?getSelectedThemeItem(language: "dark".tr()):
                getUnselectedThemeItem(language: "dark".tr()),
          ),
          InkWell(
            onTap: (){
              themeProvider.ChangeTheme(ThemeMode.light);
            },
              child: themeProvider.appTheme==ThemeMode.light?getSelectedThemeItem(language: "light".tr()):
              getUnselectedThemeItem(language: "light".tr()),
          ),
        ],
      ),
    );
  }
  Widget getSelectedThemeItem({required String language}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(language,style: AppStyles.Semi24MainLightColor,),
        Icon(Icons.check,color: Appcolors.MainLightColor,size: 30,),
      ],
    );
  }
  Widget getUnselectedThemeItem({required String language}){
    return Text(language,style: AppStyles.Semi20Black,);
  }
}
