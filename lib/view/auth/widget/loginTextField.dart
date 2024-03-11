
import 'package:flutter/material.dart';
import '../../../core/decoration/color.dart';

class LoginTextField extends StatelessWidget {

  final String labelText;
  final Widget prefixIcon;
   Widget? suffixIcon;
  final String? Function(String? s) validator;
  final TextEditingController controller;
  final bool obscureText;
  final bool enableSuggestions;
  FocusNode? focusNode;
  void Function(String)? onChange;

  LoginTextField({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
     this.suffixIcon,
     this.focusNode,
    required this.controller,
    required this.validator,
    required this.obscureText,
    required this.enableSuggestions,
    this.onChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
      child: TextFormField(
        controller: controller,
      //  textCapitalization: TextCapitalization.characters,
        validator: validator,
        cursorColor: Colors.grey[700],
        cursorWidth: 2,
        cursorHeight: 25,
        style: TextStyle(
          shadows: [
            Shadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ],
          fontSize: 20,
        ),
        strutStyle: const StrutStyle(leading: .3,),
        onChanged: onChange,
        decoration: InputDecoration(
          focusedBorder:   const OutlineInputBorder(
       //   borderSide: BorderSide(color: ColorC.teal,),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gapPadding: 5,
        ),
          errorStyle: const TextStyle(fontSize: 15),
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.black12),
            gapPadding: 5,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            gapPadding: 5,
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            gapPadding: 5,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefixIconColor:ColorC.grey,
          labelText: labelText,
          labelStyle:  const TextStyle(
              fontSize: 20, letterSpacing: 1.5,
              color:  Colors.black54 ),
        ),
        focusNode: focusNode,
        obscureText: obscureText,
        enableSuggestions: enableSuggestions,
        autocorrect: false,

      ),
    );
  }
}
