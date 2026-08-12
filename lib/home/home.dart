import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/home/tabs/favorite/favorite_tab.dart';
import 'package:evently_app/home/tabs/home/home_tab.dart';
import 'package:evently_app/home/tabs/profile/profile_tab.dart';
import 'package:evently_app/home/theme_bottom_sheet.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/utils/appcolors.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
  List <Widget> tabList=[
    HomeTab(),
    FavoriteTab(),
    ProfileTab(),
  ];
  @override
  Widget build(BuildContext context) {
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    context.setLocale(Locale(languageProvider.AppLanguage));
    return Scaffold(
      body: tabList[selectedIndex],
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
              child: Icon(Icons.add,color: Appcolors.WhiteColor,size: 30,),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
          builtBottomNavItem(
              selectedIcon: Icon(Icons.home_filled),
              unselectedIcon: Icon(Icons.home_outlined),
              title: "home".tr(), isSelected: selectedIndex==0),
            builtBottomNavItem(
                selectedIcon: Icon(Icons.favorite),
                unselectedIcon: Icon(Icons.favorite_border_outlined),
                title: "favorite".tr(), isSelected: selectedIndex==1),
            builtBottomNavItem(
                selectedIcon: Icon(Icons.person),
                unselectedIcon: Icon(Icons.person_outline_outlined),
                title: "profile".tr(), isSelected: selectedIndex==2)
          ],
        currentIndex: selectedIndex,
        onTap: (index){
            selectedIndex=index;
            setState(() {

            });
        },
      )
    );
  }
  BottomNavigationBarItem builtBottomNavItem({required Widget selectedIcon,required Widget unselectedIcon,required String title,required bool isSelected}){
    return BottomNavigationBarItem(
        icon: isSelected?selectedIcon:unselectedIcon,
        label: title);
  }
}

