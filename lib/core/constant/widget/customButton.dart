import 'package:flutter/material.dart';

import '../font.dart';

class CustomTextButton extends StatelessWidget {

  const CustomTextButton({
    super.key,
    required this.text ,
    required this.fontSize,
    required this.onPressed,
    required this.color,
    });

  final Color color;
  final String text ;
  final double fontSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child:  Text(text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: Font.f1),),);
  }
}
