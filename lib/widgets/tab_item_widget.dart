import 'package:evently_app/utils/appstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/size_utils.dart';

class TabItemWidget extends StatelessWidget {
  final bool isSelected;
  final Color UnSelectedColor;
  final String eventName;
  const TabItemWidget({super.key,required this.isSelected,
    required this.UnSelectedColor,
    required this.eventName,
    });
  @override
  Widget build(BuildContext context) {
    var height =context.height;
    var width =context.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.04,
        vertical: height*0.01
      ),
      decoration: BoxDecoration(
        color: isSelected?Theme.of(context).cardColor:UnSelectedColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color: Theme.of(context).dividerColor,
        )
      ),
      child: Text(eventName,style: isSelected?AppStyles.Medium16White:Theme.of(context).textTheme.headlineMedium,),
    );
  }
}
