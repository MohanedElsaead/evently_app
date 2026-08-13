import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height =context.height;
    var width =context.width;
    return Padding(padding:
    EdgeInsetsGeometry.symmetric(
      horizontal: width*0.04,
      vertical: height*0.04,
    ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text("welcome back".tr()),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
