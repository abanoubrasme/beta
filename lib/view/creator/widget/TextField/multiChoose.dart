import 'package:beta/core/decoration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultiChoose extends StatelessWidget {

  MultiChoose({super.key,
    required this.color,

     this.controller ,
    required this.answer,
    required this.onChanged,
  });


 final Color color;
 String answer;
  void Function(String)? onChanged;
  TextEditingController? controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: color,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: const Offset(0, 2)),
            ]),
        child: Center(
            child: TextField(
              controller: controller,
              scrollPadding: const EdgeInsets.all(10),
              textAlignVertical: TextAlignVertical.center,
              textInputAction: TextInputAction.done,
              onChanged:  onChanged ,
              style: const TextStyle(fontSize: 20, color: Colors.white),
              cursorHeight: 25,
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
              maxLines: 3,
              minLines: 1,
              maxLength: 50,
              decoration: InputDecoration(
                counterStyle: TextStyle(color: ColorC.grey.withOpacity(0)),
                hintStyle:
                    TextStyle(fontSize: 20, color: ColorC.white.withOpacity(.5)),
                hintText: " Add Answer".tr,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
          ),
        )),
      ),
    );
  }
}
// switch (ke) {
//   case 1:
//     quizController.answer1 = s;
//     break;
//   case 2:
//     quizController.answer2 = s;
//     break;
//   case 3:
//     quizController.answer3 = s;
//     break;
//   case 4:
//     quizController.answer4 = s;
//     break;
// }