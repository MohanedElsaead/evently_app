import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/providers/language_provider.dart';
import 'package:evently_app/utils/appcolors.dart';
import 'package:evently_app/utils/appstyles.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider=Provider.of<AppLanguageProvider>(context);
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
              languageProvider.changeLanguage("en");
            },
            child: languageProvider.AppLanguage=="en"?getSelectedLanguageItem(language: "english".tr()):
                getUnselectedLanguageItem(language: "english".tr()),
          ),
          InkWell(
            onTap: (){
              languageProvider.changeLanguage("ar");
            },
              child: languageProvider.AppLanguage=="ar"?getSelectedLanguageItem(language: "arabic".tr()):
              getUnselectedLanguageItem(language: "arabic".tr()),
          ),
        ],
      ),
    );
  }
  Widget getSelectedLanguageItem({required String language}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(language,style: AppStyles.Semi24MainLightColor,),
        Icon(Icons.check,color: Appcolors.MainLightColor,size: 30,),
      ],
    );
  }
  Widget getUnselectedLanguageItem({required String language}){
    return Text(language,style: AppStyles.Semi20Black,);
  }
}
