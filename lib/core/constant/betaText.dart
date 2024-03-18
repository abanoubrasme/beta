import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BeTaText extends StatelessWidget {

   BeTaText({super.key,
     required this.text,
      this.color,
     required this.fontSize,
     required this.padding
   });

      String text;
      Color? color;
      double fontSize;
      EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:padding ,
      child: Text(
        text,
        style: context.textTheme.displayLarge
      ),
    );
  }
}
