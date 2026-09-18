import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:evently_app/utils/appassets.dart';
import 'package:evently_app/utils/appcolors.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../language_bottom_sheet.dart';

class ProfileTab extends StatefulWidget {
   ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
      height=context.height;
      width=context.width;
      var themeProvider=Provider.of<AppThemeProvider>(context);
      var userProvider=Provider.of<UserProvider>(context);

      return Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: height!*0.02,
        children: [
          SizedBox(height: height!*0.04,),
          CircleAvatar(
            radius: 50,
            backgroundImage:AssetImage(Appassets.RouteIcon),
          ),
          Text(userProvider.currentUser?.name??"",style: Theme.of(context).textTheme.headlineLarge,),
          Text(userProvider.currentUser?.email??"",style: Theme.of(context).textTheme.bodyLarge,),
          _buildItemWidget(isDark: themeProvider.isDark,text: "dark".tr(), item: Switch(
            activeTrackColor: Appcolors.MainDarkColor,
              activeThumbColor: Appcolors.WhiteColor,
              inactiveThumbColor: Appcolors.WhiteColor,
              inactiveTrackColor: Appcolors.StrokeWhiteColor,
              trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
               if (states.contains(WidgetState.disabled)) {
                return Appcolors.GreyColor; // Color when disabled
               }
               return Appcolors.Transparent;
              }),
              value: themeProvider.isDark,
              onChanged: (value){
                themeProvider.ChangeTheme(
                  value ? ThemeMode.dark : ThemeMode.light,
                );
              })),
          _buildItemWidget(isDark: themeProvider.isDark,text: "language".tr(),
              item: IconButton(onPressed: (){
              showLanguageBottomSheet();
              },
                  icon: Icon(Icons.arrow_forward_outlined,color: Theme.of(context).cardColor,))),
          _buildItemWidget(isDark: themeProvider.isDark,text: "logout".tr(),
              item: IconButton(onPressed: (){
                
              },
                  icon:Icon(Icons.login_outlined,color: Appcolors.Red,))),
      ],
        ),
      ),
    ),
    );
  }

  Widget _buildItemWidget({
    required bool isDark,
    required String text,required Widget item}){
    return Container(
      decoration: BoxDecoration(
        color: isDark?Appcolors.Transparent:Appcolors.WhiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: 2,
        )
      ),
      child: ListTile(
        contentPadding:EdgeInsets.symmetric(
          horizontal:width!*0.03,
          vertical: height!*0.01
        ) ,
        title: Text(text,style: Theme.of(context).textTheme.headlineMedium,),
        trailing: item,
      ),
    );
  }
  void showLanguageBottomSheet(){
    showModalBottomSheet(context: context,
      builder: (context)=>LanguageBottomSheet(),
    );
  }
}
