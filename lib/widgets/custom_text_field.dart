import 'package:evently_app/utils/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
typedef onchanged =void Function(String)?;
typedef onValidator =String? Function(String?)?;

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
  final int? Lines;
  final TextEditingController? TextController;
  final onchanged? OnChanged;
  final onValidator? Validator;
  final TextInputType? KeyboardType;
  final bool ObscureText;
  const CustomTextField({super.key,this.radius,this.bordercolor,this.hintText
  ,this.labelText,this.hintStyle,
    this.labelStyle,this.fillcolor,
    this.fill=false,this.prefixIcon,
    this.suffixIcon,this.Lines,
    this.TextController,this.OnChanged,
    this.Validator,this.KeyboardType=TextInputType.text,this.ObscureText=false
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines:Lines,
      controller: TextController,
      onChanged: OnChanged,
      validator: Validator,
      obscureText: ObscureText,
      obscuringCharacter: "*",
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
