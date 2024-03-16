import 'package:flutter/material.dart';

class BeTaText extends StatelessWidget {

   BeTaText({super.key,
     required this.text,
     required this.color,
     required this.fontSize,
     required this.padding
   });

      String text;
      Color color;
      double fontSize;
      EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:padding ,
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontFamily: "Water_Brush"),
      ),
    );
  }
}
