import 'package:flutter/material.dart';


class CustomTextButton extends StatelessWidget {

   CustomTextButton({
    super.key,
    required this.padding,
    required this.text ,
    required this.fontSize,
    required this.onPressed,
    required this.color,
    });

  final Color color;
  final String text ;
  final double fontSize;
  EdgeInsetsGeometry padding;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextButton(
        onPressed: onPressed,
        child:  Text(text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
          ),),),
    );
  }
}
