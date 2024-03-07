import 'package:flutter/material.dart';
import '../../../core/constant/font.dart';

class LoginButton extends StatelessWidget {

   const LoginButton({super.key,required this.text,required this.onPressed, });

   final void Function()? onPressed;
   final String text;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: MaterialButton(
        height: 50,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        color: Colors.teal,
        onPressed: onPressed,
        child:  Text(text,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: Font.f1),
        ),

      ),
    );
  }
}
