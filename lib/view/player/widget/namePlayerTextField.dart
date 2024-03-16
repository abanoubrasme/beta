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
    this.controller,
     this.onChanged,
    this.keyboardType
    });

  final String labelText;
  final Widget prefixIcon;
  int? maxLength;
  TextInputType? keyboardType;
  void Function(String)? onChanged;
   String Function(String?)? validator;
  TextEditingController? controller;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLength: maxLength,
        validator: validator,
     //   cursorColor: ColorC.grey2,
        cursorWidth: 3,
        cursorHeight: 28,
        style: TextStyle(
          fontSize: 20,
          shadows: [
            Shadow(
              color: ColorC.grey.withOpacity(.5),
              blurRadius: 7,
              offset: const Offset(0 , 3),
            )
          ],
        ),
        strutStyle: const StrutStyle(leading: .5,),
        onChanged:onChanged,
        decoration:InputDecoration(
          focusedBorder:  OutlineInputBorder(
           // borderSide: BorderSide(color: ColorC.grey),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            gapPadding: 5,
          ),
          enabledBorder:  OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
           // borderSide: BorderSide(color: ColorC.grey),
            gapPadding: 5,
          ),
          errorBorder:   const OutlineInputBorder(
            borderSide: BorderSide(color: ColorC.redDark),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            gapPadding: 5,
          ),
          focusedErrorBorder:  const OutlineInputBorder(
            borderSide: BorderSide(color: ColorC.redDark),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            gapPadding: 5,
          ),

          labelText: labelText,
          prefixIconColor: ColorC.grey,
          prefixIcon: prefixIcon,
          alignLabelWithHint: true,
          labelStyle: const TextStyle(
            letterSpacing: 1,
           // color: Colors.black45,
            fontSize: 18,),
        ),
      ),
    );
  }
}