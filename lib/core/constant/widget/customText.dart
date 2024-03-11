import 'package:flutter/material.dart';
import '../../decoration/font.dart';

class CustomText extends StatelessWidget {
   CustomText({super.key,required this.text,required this.fontSize,required this.color});
  String text;
  double fontSize;
  Color color;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(text,
        textAlign: TextAlign.center,
        style:  TextStyle(
            color: color,
            fontSize: fontSize,
            fontFamily: Font.f1,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
