import 'package:flutter/material.dart';
import '../../decoration/font.dart';

class CustomText extends StatelessWidget {

   CustomText({super.key,
     required this.text,
      this.fontSize,
      this.color,
      this.padding,
     this.style

   });

     String text;
     double? fontSize;
     Color? color;
     TextStyle? style;
     EdgeInsetsGeometry? padding ;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(text,
        textAlign: TextAlign.center,
        style: style,
      ),
    );
  }
}
// TextStyle(
// color: color,
// fontSize: fontSize,
// fontFamily: Font.f1,
// fontWeight: FontWeight.w500)