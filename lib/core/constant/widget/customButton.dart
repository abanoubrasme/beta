import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../decoration/color.dart';
import '../../decoration/font.dart';

class CustomButton extends StatelessWidget {

  const CustomButton({super.key,
    required this.text ,
    required this.onPressed
  });

  final String text;
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
            child: Text(text,
              style: TextStyle(fontSize: 24, color: ColorC.white,fontFamily: Font.f1),
            )));
  }
}