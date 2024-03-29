import 'package:flutter/material.dart';

class MultiChooseEdit extends StatelessWidget {
  Color color;
  TextEditingController controller = TextEditingController();
  void Function(String)? onChanged;



  MultiChooseEdit({super.key,
    required this.color,
    required this.controller,
    required this.onChanged
  });
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
              onChanged: onChanged,
              style: const TextStyle(fontSize: 20, color: Colors.white),
              cursorHeight: 25,
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
              maxLines: 3,
              minLines: 1,
              maxLength: 50,
              decoration: InputDecoration(
                counterStyle: TextStyle(color: Colors.grey.shade50.withOpacity(0)),
                hintStyle:
                TextStyle(fontSize: 20, color: Colors.white.withOpacity(.5)),
                hintText: " Add Answer",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            )),
      ),
    );
  }
}
// onChanged: (answer) {
// try{
// switch (ke) {
// case 1:
// quizController.answer1 = answer;
// editQuizController.updateQuestion(myServices.sharePref!.get("id_question").toString(), answer,"answer1");
// quizController.update();
// break;
// case 2:
// quizController.answer2 = answer;
// editQuizController.updateQuestion(myServices.sharePref!.get("id_question").toString(), answer,"answer2");
// quizController.update();
// break;
// case 3:
// quizController.answer3 = answer;
// editQuizController.updateQuestion(myServices.sharePref!.get("id_question").toString(), answer,"answer3");
// quizController.update();
// break;
// case 4:
// quizController.answer4 = answer;
// editQuizController.updateQuestion(myServices.sharePref!.get("id_question").toString(), answer,"answer4");
// quizController.update();
// break;
// }
// }catch(e){}
// quizController.update();
// },