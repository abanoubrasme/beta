import 'package:beta/control/player/playerController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/creator/nameQuizController.dart';

class TextFieldNamePlayer extends StatelessWidget {

  TextFieldNamePlayer({super.key,
  required this.onChanged,
  });

  void Function(String)? onChanged;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        cursorColor: Colors.grey[700],
        cursorWidth: 3,
        cursorHeight: 28,
        style: TextStyle(
          shadows: [
            Shadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 7,
              offset: const Offset(0 , 3),
            )
          ],
          fontSize: 20,
        ),
        strutStyle: const StrutStyle(leading: .5,),
        onChanged:onChanged,
        decoration:  const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gapPadding: 0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.black45),
          ),
          errorBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gapPadding: 5,
          ),
          focusedErrorBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gapPadding: 5,
          ),
          labelText: " Enter Your Name",
          alignLabelWithHint: true,
          labelStyle: TextStyle(letterSpacing: 1, color: Colors.black45,fontSize: 18,),
        ),
      ),
    );
  }
}