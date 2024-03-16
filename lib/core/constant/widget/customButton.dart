import 'package:flutter/material.dart';
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
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 6),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), ),),
        onPressed: onPressed,
        child: Text(text,
          style: TextStyle(fontSize: 24, color: ColorC.white,fontFamily: Font.f1),
        )
    );
  }
}