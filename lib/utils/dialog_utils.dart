import 'package:evently_app/utils/appcolors.dart';
import 'package:evently_app/utils/appstyles.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading({required BuildContext context,required String LoadingText}){
    showDialog(context: context,
        barrierDismissible: false,
        builder: (context){
        return AlertDialog(
          content: Row(
            spacing: context.width*0.04,
            children: [
              CircularProgressIndicator(
                color: Appcolors.MainLightColor,
              ),
              Text(LoadingText,style: AppStyles.Semi16MainLightColor,)
            ],
          ),
        );
        });
  }
  static void hideLoading({required BuildContext context}){
    Navigator.pop(context);
  }
  static void showMessage({required BuildContext context,
    required String Content,String Title="",
    String? posActionName,
    VoidCallback? posAction,
    String? negActionName,
    VoidCallback? negAction}){
    List<Widget> actions=[

    ];
    if(posActionName!=null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        posAction?.call();
      },child: Text(posActionName,style: AppStyles.Semi16MainLightColor,),));
    }
    if(negActionName!=null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        negAction?.call();
      },child: Text(negActionName,style: AppStyles.Semi16MainLightColor,),));
    }

    showDialog(context: context,
        builder:(context){
        return AlertDialog(
        content: Text(Content,style: AppStyles.Semi16MainLightColor,),
          title: Text(Title,style: AppStyles.Semi14MainLightColor,),
          actions: actions,
        );
        }
        );
  }
}