import 'package:flutter/material.dart';
import '../../../../core/decoration/color.dart';

class EditNameTextField extends StatelessWidget {

  EditNameTextField({super.key,
    required this.labelText,
    required this.padding,
    this.valid,
    required this.onChanged,
    required this.icon,
    required this.maxLength,
    required this.keyboardType,
  });

  String? Function(String? s)? valid;
  final void Function(String)? onChanged;
  EdgeInsetsGeometry padding;
  final String labelText;
   TextEditingController? controller = TextEditingController();
  final Widget icon;
  final int maxLength ;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextField(
        textInputAction: TextInputAction.done,
        maxLength: maxLength,
        textCapitalization: TextCapitalization.words,
        keyboardType: keyboardType,
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
        strutStyle: const StrutStyle(leading: .3,),
        onChanged: onChanged,
        decoration:  InputDecoration(
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: ColorC.teal),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            gapPadding: 5,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.black12),
          ),
          errorBorder:  const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gapPadding: 5,
          ),
          focusedErrorBorder:  const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gapPadding: 5,
          ),
          labelText: labelText,
          prefixIcon: icon,
          prefixIconColor: ColorC.grey,
          alignLabelWithHint: true,
          labelStyle: const TextStyle(letterSpacing: 1, color: Colors.black54,fontSize: 18,),
        ),
      ),
    );
  }
}


