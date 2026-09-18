import 'package:evently_app/utils/size_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateOrTimeWidget extends StatelessWidget {
  final Widget Icon;
  final String  eventDateorTime;
  final String  chooseDateorTime;
  final VoidCallback onChooseClick;
  DateOrTimeWidget({super.key,required this.Icon,required this.eventDateorTime,required this.onChooseClick,required this.chooseDateorTime});

  @override
  Widget build(BuildContext context) {
    var width=context.width;
    return Row(
      spacing: width*0.04,
      children: [
      Icon,
        Text(eventDateorTime,style: Theme.of(context).textTheme.headlineMedium,),
        Spacer(),
        TextButton(onPressed: onChooseClick, child: Text(chooseDateorTime,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            decoration: TextDecoration.underline,
            decorationColor: Theme.of(context).cardColor,
          ),))
      ],
    );
  }
}
