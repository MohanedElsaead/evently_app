import 'package:evently_app/utils/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final double? radius;
  final Color? bordercolor;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final Color? fillcolor;
  final bool? fill;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  const CustomTextField({super.key,this.radius,this.bordercolor,this.hintText
  ,this.labelText,this.hintStyle,this.labelStyle,this.fillcolor,this.fill=false,this.prefixIcon,this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: builtDecorationItem(Radius: radius??16,
            borderColor: bordercolor??Appcolors.StrokeWhiteColor),
            focusedBorder: builtDecorationItem(Radius: radius??16,
          borderColor: bordercolor??Appcolors.StrokeWhiteColor),
          errorBorder: builtDecorationItem(Radius: radius??16,
          borderColor: Appcolors.Red),
        focusedErrorBorder: builtDecorationItem(Radius: radius??16,
            borderColor: Appcolors.Red),
          hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        fillColor: fillcolor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
  OutlineInputBorder builtDecorationItem({required double Radius,required Color borderColor}){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(Radius),
          borderSide: BorderSide(
        color: borderColor,
      width: 2,
    )
    );
  }
}
