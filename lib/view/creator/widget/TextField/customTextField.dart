import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../control/RDB_Controller.dart';
import '../../../../control/creator/nameQuizController.dart';
import '../../../../control/creator/quizzesController.dart';
import '../../../../core/decoration/color.dart';


class CustomTextField extends StatelessWidget {

    CustomTextField({super.key,
      required this.padding,
      required this.hintText,
      required this.prefixIcon,
      this.suffixIcon,
      this.controller,
      this.maxLength,
      this.enableSuggestions,
      this.focusNode,
      this.obscureText,
      this.keyboardType,
      this.validator,
      this.onChanged,
    });


    final String hintText;
    final TextEditingController? controller;
    final Widget prefixIcon;
    Widget? suffixIcon;
    final int? maxLength ;
    bool? obscureText;
    bool? enableSuggestions;
    FocusNode? focusNode;
    EdgeInsetsGeometry padding;
    final TextInputType? keyboardType;
    String? Function(String? s)? validator;
    final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.done,
        validator: validator,
        maxLength: maxLength,
        textCapitalization: TextCapitalization.words,
        keyboardType: keyboardType,
        cursorColor: context.theme.hintColor,
        cursorWidth: 3,
        cursorHeight: 28,
        obscureText: obscureText ?? false ,
        focusNode: focusNode,
        enableSuggestions: enableSuggestions ?? true,
        autocorrect: false,
        style:  context.textTheme.displaySmall,
       // strutStyle: const StrutStyle(leading:0,),
        onChanged: onChanged,
        decoration:  InputDecoration(
          fillColor: context.theme.primaryColorLight,
          filled: true,
          focusedBorder:   OutlineInputBorder(
            borderSide: BorderSide(color: context.theme.primaryColorLight),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            gapPadding: 5,
          ),
          enabledBorder:   OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: context.theme.primaryColorLight),
          ),
          errorBorder:  const OutlineInputBorder(
            borderSide: BorderSide(color: ColorC.redDark),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            gapPadding: 5,
          ),
          focusedErrorBorder:  const OutlineInputBorder(
            borderSide: BorderSide(color: ColorC.redDark),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            gapPadding: 5,
          ),
          hintText:  hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefixIconColor: context.theme.hintColor,
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}


