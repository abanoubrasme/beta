import 'package:flutter/material.dart';
import '../../../core/decoration/color.dart';
import '../../../core/decoration/font.dart';

class ButtonCode extends StatelessWidget {
  const ButtonCode({super.key,required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: ColorC.teal),
          borderRadius: BorderRadius.circular(15),
          color: ColorC.teal,
        ),
        margin:  const EdgeInsets.all(15),
        child: TextButton(
            onPressed: onPressed,
            child: Text("Connect",
              style: TextStyle(fontSize: 24, color: ColorC.white,fontFamily: Font.f1),
            )));
  }
}