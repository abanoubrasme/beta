import 'package:beta/control/creator/editQuizController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../control/creator/quizController.dart';
import '../../../../services/myServices.dart';

class QuestionTextFieldEdit extends StatelessWidget {

  QuestionTextFieldEdit({super.key,required this.controller});

  QuizController quizController =Get.put(QuizController());
  EditQuizController editQuizController =Get.put(EditQuizController());
  MyServices myServices = Get.find();

  final TextEditingController controller ;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
        builder: (quizController){
          return TextField(
            controller: controller,
            scrollPadding: const EdgeInsets.all(10),
            textAlignVertical: TextAlignVertical.center,
            textInputAction: TextInputAction.done,
            onChanged: (question) {
              quizController.question = question ;
             var idQuestion = myServices.sharePref!.get("id_question").toString();
              editQuizController.updateQuestion(idQuestion, question,"question");
              quizController.update();
            },
            cursorColor: Colors.black12,
            cursorHeight: 40,
            textAlign: TextAlign.center,
            maxLines: 5,
            style: const TextStyle(fontSize: 25),
            decoration: const InputDecoration(
              hintText: "Add Question",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          );
    });
  }
}
