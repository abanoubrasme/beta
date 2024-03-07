import 'package:flutter/material.dart';
import '../../../core/constant/font.dart';
import '../../../core/decoration/Colors.dart';

class SignUpTextButton extends StatelessWidget {

   SignUpTextButton({super.key,
     required this.text,
     required this.onPressed,
     required this.textButton,
   });

    final String text;
    final String textButton;
    void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,style: TextStyle(color: ColorC.grey,fontFamily: Font.f1),),
        TextButton(
            onPressed: onPressed,
            child:  Text(
             textButton,
              style:  TextStyle(color: ColorC.teal,fontFamily: Font.f1,fontSize: 18),
            ))
      ],
    );
  }
}
