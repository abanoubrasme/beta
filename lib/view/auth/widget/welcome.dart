import 'package:flutter/material.dart';
import '../../../core/constant/font.dart';

class CustomText extends StatelessWidget {
   CustomText({super.key,required this.text,required this.fontSize,required this.color});
  String text;
  double fontSize;
  Color color;

  @override
  Widget build(BuildContext context) {
    return  Text(text,
      textAlign: TextAlign.center,
      style:  TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: Font.f1,
          fontWeight: FontWeight.w500),
    );
  }
}
