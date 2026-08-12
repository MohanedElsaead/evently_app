import 'package:evently_app/utils/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color? backgroundColor;
  final double? radius;
  final Color? sideColor;
  final double? verticalPadding;
  const CustomElevatedButton({super.key,required this.onPressed,
    required this.child,this.backgroundColor,this.radius,this.sideColor,this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:backgroundColor??Appcolors.Transparent,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding??0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius??16),
        ),
          side: BorderSide(
          width: 2,
            color:sideColor??Appcolors.Transparent,
      )
      ),
        onPressed: onPressed, child:child);
  }
}
