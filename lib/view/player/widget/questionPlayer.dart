import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../control/creator/quizController.dart';
import '../../../core/decoration/color.dart';

class QuestionPlayer extends StatelessWidget {
  final String question ;
  QuestionPlayer({super.key,required this.question});
  QuizController quizController =Get.put(QuizController());
  TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
          color: ColorC.white,
          boxShadow: [
            BoxShadow(
                color: context.theme.shadowColor,
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 2)),
          ]
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child:  Center(
          child: Text(question,style: TextStyle(fontSize: 22,color: ColorC.grey2),)),
    );
  }
}
