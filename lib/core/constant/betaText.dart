import 'package:flutter/material.dart';

class BeTaText extends StatelessWidget {
   BeTaText({super.key,required this.text,required this.color,required this.fontSize});
String text;
Color color;
double fontSize;
  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontFamily: "Water_Brush"),
    );
  }
}
