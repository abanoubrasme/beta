import 'package:flutter/material.dart';
import '../../decoration/color.dart';

class CustomButton extends StatelessWidget {

   CustomButton({super.key,
    required this.text ,
     this.padding,
    required this.onPressed,
  });

  final String text;
  EdgeInsetsGeometry? padding;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero ,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), ),),
          onPressed: onPressed,
          child: Text(text,
            style: TextStyle(fontSize: 24, color: ColorC.white,),
          )
      ),
    );
  }
}