import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/decoration/font.dart';

class LoginButton extends StatelessWidget {

   const LoginButton({super.key,
     required this.text,
     required this.onPressed,
   });

   final void Function()? onPressed;
   final String text;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: MaterialButton(
        height: 60,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        color: context.theme.canvasColor,
        onPressed: onPressed,
        child:  Text(text,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 22,),
        ),

      ),
    );
  }
}
