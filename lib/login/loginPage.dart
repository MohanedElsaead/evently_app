import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/utils/appassets.dart';
import 'package:evently_app/utils/appcolors.dart';
import 'package:evently_app/utils/appstyles.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:evently_app/widgets/custom_elevated_button.dart';
import 'package:evently_app/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    var width=context.width;
    var height=context.height;
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(padding: EdgeInsetsGeometry.symmetric(
          horizontal: width*0.04
        ),
         child: Form(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             spacing: height*0.02,
              children: [
                Image.asset(themeProvider.isDark?Appassets.SmallEventlyLogoDark:Appassets.SmallEventlyLogoLight),
                Text("login to your account".tr(),style: Theme.of(context).textTheme.headlineSmall,),
                CustomTextField(hintText: "please enter email".tr(),
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                  bordercolor: Theme.of(context).dividerColor,
                  fill: true,
                  fillcolor: themeProvider.isDark?Appcolors.InputsD:Appcolors.InputsL,
                  prefixIcon: Icon(Icons.mail_outline,color: Appcolors.GreyColor,),
                ),
                CustomTextField(hintText: "please enter password".tr(),
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                  bordercolor: Theme.of(context).dividerColor,
                  fill: true,
                  fillcolor: themeProvider.isDark?Appcolors.InputsD:Appcolors.InputsL,
                  prefixIcon: Icon(Icons.lock_open_outlined,color: Appcolors.GreyColor,),
                  suffixIcon: Icon(Icons.visibility_off,color: Appcolors.GreyColor,),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){
                    }, child: Text("forget password".tr(),
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: Theme.of(context).cardColor,
                          decorationThickness: 2
                        ),
                    ),),
                  ],
                ),
                CustomElevatedButton(onPressed: login,
                    child: Text("login".tr(),style: AppStyles.Medium20WhiteDarkColor,),
                  backgroundColor: Theme.of(context).cardColor,
                  verticalPadding: height*0.015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("dont have account".tr(),style: Theme.of(context).textTheme.bodyLarge,),
                    TextButton(onPressed: (){

                    }, child: Text("sign up".tr(),
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: Theme.of(context).cardColor,
                          decorationThickness: 2
                      ),
                    ),)
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Theme.of(context).dividerColor,
                        thickness: 2,
                        indent: width*0.06,
                        endIndent: width*0.06,
                      ),
                    ),
                    Text("or".tr(),style: Theme.of(context).textTheme.labelMedium,),
                    Expanded(
                      child: Divider(color: Theme.of(context).dividerColor,
                        thickness: 2,
                        indent: width*0.06,
                        endIndent: width*0.06,
                      ),
                    )
                  ],
                ),
                CustomElevatedButton(onPressed: (){

                },
                  child: Row(
                    spacing: width*0.02,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Appassets.GoogleIcon),
                      Text("login with google".tr(),
                        style: Theme.of(context).textTheme.labelMedium,),
                    ],
                  ),
                  backgroundColor: themeProvider.isDark?Appcolors.InputsD:Appcolors.WhiteColor,
                  verticalPadding: height*0.015,
                  sideColor: Theme.of(context).dividerColor,
                ),
            ],
                   ),
         ),
        ),
      ),
    );
  }
  void login(){}
}
