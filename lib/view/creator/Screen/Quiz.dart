import 'package:beta/core/constant/widget/customText.dart';
import 'package:beta/view/creator/widget/TextField/multiChoose.dart';
import 'package:beta/view/creator/widget/TextField/questionTextField.dart';
import 'package:beta/view/creator/widget/Button/buttonTime.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/creator/quizController.dart';
import '../../../core/decoration/color.dart';
import '../../../services/myServices.dart';
import '../widget/Button/correctAnswerButton.dart';

class Quiz extends StatelessWidget {
   Quiz({super.key});

   QuizController quizController =Get.put(QuizController());
   MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
        builder: (quizController){
          return Scaffold(
            appBar: AppBar(
            //  backgroundColor: ColorC.white2,
              elevation: 0,
              toolbarHeight: 70,
              centerTitle: true,
              title: const Text(""),
              leading: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: CustomText(text:"Cancel".tr, fontSize: 20, color: ColorC.grey, padding: const EdgeInsets.symmetric(horizontal:0),),
              ),
              leadingWidth: 80,
              actions: [
                MaterialButton(
                  onPressed:(){
                    String idQuiz = myServices.sharePref!.get("idQuiz").toString();
                    String idUser = myServices.sharePref!.get("id_user").toString();
                    quizController.insertData(idUser,idQuiz);
                    Get.offAllNamed("/pageOfQuiz");
                    quizController.update();
                  },
                  child:CustomText(text:"Save".tr,color: ColorC.grey, fontSize: 20, padding: const EdgeInsets.symmetric(horizontal: 0),),
                ),
              ],
            ),
            body: ListView(
              children: [
                Row(
                  children: [
                    Expanded(
                      child:ButtonTime(
                        time: quizController.time,
                        selectIndexTime: quizController.selectIndexTime,),
                    ),
                    Expanded(
                      child:CorrectAnswerButton(
                        text: quizController.correctAnswer.tr,
                        answerColor: quizController.answerColor,
                        selectIndexCorrect: quizController.selectIndexCorrect,),
                    )
                  ],
                ),
                QuestionTextField(
                  onChanged: (question) {
                    quizController.question = question;
                  },),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MultiChoose(
                            color: ColorC.redDark,
                            answer: quizController.answer1,
                            onChanged: (s) {
                              quizController.answer1 = s ;
                            },

                          ),
                          MultiChoose(
                            color: ColorC.amberDark,
                            answer: quizController.answer2,
                            onChanged: (s) {
                              quizController.answer2 = s;
                            },
                            //controller: quizController.answer2E,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MultiChoose(
                            color:ColorC.blueDark,
                            answer: quizController.answer3,
                            onChanged: (s) {
                              quizController.answer3 = s;
                            },
                            // controller: quizController.answer3E,
                          ),
                          MultiChoose(
                            color:ColorC.greenDark,
                            answer: quizController.answer4,
                            onChanged: (s) {
                              quizController.answer4 = s;
                            },
                            //controller: quizController.answer4E,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

          );
        });

  }
}
