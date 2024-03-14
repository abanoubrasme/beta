import 'package:flutter/material.dart';
import '../../decoration/font.dart';

class CustomText extends StatelessWidget {
   CustomText({super.key,required this.text,required this.fontSize,required this.color,required this.padding});
  String text;
  double fontSize;
  Color color;
 EdgeInsetsGeometry padding ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: padding,
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
