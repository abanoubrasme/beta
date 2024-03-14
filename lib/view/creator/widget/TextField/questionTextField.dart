import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionTextField extends StatelessWidget {

   QuestionTextField({super.key, this.controller,required this.onChanged});


   void Function(String)? onChanged;
   TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 260,
      width: Material.defaultSplashRadius,
      decoration: BoxDecoration(color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 2)),
          ]),
      margin: const EdgeInsets.all(10),
      child: Center(
          child:TextField(
            controller: controller,
            scrollPadding: const EdgeInsets.all(10),
            textAlignVertical:TextAlignVertical.center,
            textInputAction:TextInputAction.done,
            onChanged:onChanged,
            cursorColor: Colors.black12,
            cursorHeight: 40,
            textAlign: TextAlign.center,
            maxLines: 5,
            style: const TextStyle(fontSize: 25),
            decoration:  InputDecoration(
              hintText: "Add Question".tr,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          )),
    );

  }
}
