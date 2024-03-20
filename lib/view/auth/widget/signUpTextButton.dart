import 'package:flutter/material.dart';
import '../../../core/decoration/font.dart';
import '../../../core/decoration/color.dart';

class SignUpButton extends StatelessWidget {

   SignUpButton({super.key,
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
        Text(text,style: TextStyle(color: ColorC.grey,),),
        TextButton(
            onPressed: onPressed,
            child:Text(textButton,
              style:TextStyle(color: ColorC.teal,fontSize: 18),
            ))
      ],
    );
  }
}
