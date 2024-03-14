import 'package:beta/control/player/playerController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/creator/nameQuizController.dart';
import '../../../core/decoration/color.dart';

class NamePlayerTextField extends StatelessWidget {

  NamePlayerTextField({super.key,
    required this.labelText,
    required this.prefixIcon,
     this.validator,
    this.maxLength,
    required this.onChanged,
    });

  final String labelText;
  final Widget prefixIcon;
  int? maxLength;
  void Function(String)? onChanged;
   String Function(String?)? validator;



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(left: 20, right: 20,),
      child: TextFormField(
        keyboardType: TextInputType.number,
        maxLength: maxLength,
        validator: validator,
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
        decoration:   InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gapPadding: 5,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.black45),
            gapPadding: 5,
          ),
          errorBorder:  const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gapPadding: 5,
          ),
          focusedErrorBorder:  const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gapPadding: 5,
          ),
          labelText: labelText,
          prefixIconColor: ColorC.grey,
          prefixIcon: prefixIcon,
          alignLabelWithHint: true,
          labelStyle: const TextStyle(letterSpacing: 1, color: Colors.black45,fontSize: 18,),
        ),
      ),
    );
  }
}