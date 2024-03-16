import 'package:beta/view/creator/widget/hasData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/creator/quizController.dart';
import '../../../control/creator/editQuizController.dart';
import '../../../core/constant/widget/customText.dart';
import '../../../core/decoration/color.dart';
import '../../../services/myServices.dart';
import '../widget/Button/correctAnswerEdit.dart';
import '../widget/Button/timeEdit.dart';
import '../widget/TextField/multiChooseTextFieldEdit.dart';
import '../widget/TextField/questionTextFieldEdit.dart';

class EditQuiz extends StatelessWidget {
   EditQuiz({super.key});

   EditQuizController editQuizController =Get.put(EditQuizController());
   QuizController quizController =Get.put(QuizController());
   MyServices myServices = Get.find();

   @override
  Widget build(BuildContext context) {
    return  Scaffold(
              appBar: AppBar(
              //  backgroundColor: ColorC.white2,
                elevation: 0,
                toolbarHeight: 70,
                centerTitle: true,
                title: const Text(""),
                leading: IconButton(
                  onPressed: () async{
                    quizController.update();
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios_new,color: ColorC.grey,) ,
                ),
                actions: [
                  MaterialButton(
                      onPressed: () {
                        editQuizController.update();
                        Get.toNamed("pageOfQuiz");
                      },
                      child:CustomText(text:"Save".tr,color: ColorC.grey, fontSize: 20, padding: const EdgeInsets.symmetric(horizontal: 0),
                      )),
                ],
              ),
              body: FutureBuilder(
                     future: editQuizController.getAllData(myServices.sharePref!.get("idQuestion").toString()),
                     builder: (BuildContext context, AsyncSnapshot snapshot) {
                             WidgetsBinding.instance.addPostFrameCallback((_){
                               editQuizController.questionE.text = snapshot.data?["data"][0]['question'] ?? "";
                               editQuizController.answer1E.text  = snapshot.data?['data'][0]['answer1'] ?? "";
                               editQuizController.answer2E.text  = snapshot.data?['data'][0]['answer2'] ?? "";
                               editQuizController.answer3E.text  = snapshot.data?['data'][0]['answer3'] ?? "";
                               editQuizController.answer4E.text  = snapshot.data?['data'][0]['answer4'] ?? "";
                               editQuizController.correctAnswerE = snapshot.data?['data'][0]['correct_answer'] ?? "";
                               editQuizController.timeE = snapshot.data?['data'][0]['time'] ?? 5;
                               editQuizController.selectIndexTimeE = snapshot.data?['data'][0]['index_time'] ?? 0;
                               editQuizController.answerColorE = snapshot.data?['data'][0]['color'] ?? Colors.teal.value.toString();
                               editQuizController.selectIndexCorrectE = snapshot.data?['data'][0]['index_color'] ?? 0;
                               editQuizController.update();
                             });
                          if (!snapshot.hasData) {
                            return const HasData();
                          }
                          if (snapshot.hasError) {
                            return const HasData();
                          }
                          else {
                            return GetBuilder<EditQuizController>(
                            builder: (editQuizController) {
                               return   ListView(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: TimeButtonEdit(
                                          time: editQuizController.timeE,
                                          selectIndexTime: editQuizController.selectIndexTimeE,
                                          onSelected: (s, index, b) async {
                                          String idQuestion = myServices.sharePref!.getInt("idQuestion").toString();
                                          switch (index) {
                                            case 0:
                                              editQuizController.timeE = 5;
                                              editQuizController.selectIndexTimeE = index;
                                              editQuizController.update();
                                              editQuizController.updateQuestion(idQuestion,editQuizController.timeE,"time");
                                              editQuizController.updateQuestion(idQuestion,editQuizController.selectIndexTimeE,"index_time");
                                              editQuizController.update();
                                              break;
                                            case 1:
                                              editQuizController.timeE = 10;
                                              editQuizController.selectIndexTimeE = index;
                                              editQuizController.update();
                                              editQuizController.updateQuestion(idQuestion,editQuizController.timeE,"time");
                                              editQuizController.updateQuestion(idQuestion, editQuizController.selectIndexTimeE,"index_time");
                                              editQuizController.update();
                                              break;
                                            case 2:
                                              editQuizController.timeE = 15;
                                              editQuizController.selectIndexTimeE = index;
                                              editQuizController.update();
                                              editQuizController.updateQuestion(idQuestion,editQuizController.timeE,"time");
                                              editQuizController.updateQuestion(idQuestion, editQuizController.selectIndexTimeE,"index_time");
                                              editQuizController.update();
                                              break;
                                            case 3:
                                              editQuizController.timeE = 20;
                                              editQuizController.selectIndexTimeE = index;
                                              editQuizController.update();
                                              editQuizController.updateQuestion(idQuestion,editQuizController.timeE,"time");
                                              editQuizController.updateQuestion(idQuestion, editQuizController.selectIndexTimeE,"index_time");
                                              editQuizController.update();
                                              break;
                                            case 4:
                                              editQuizController.timeE = 25;
                                              editQuizController.selectIndexTimeE = index;
                                              editQuizController.update();
                                              editQuizController.updateQuestion(idQuestion,editQuizController.timeE,"time");
                                              editQuizController.updateQuestion(idQuestion, editQuizController.selectIndexTimeE,"index_time");
                                              editQuizController.update();
                                              break;
                                            case 5:
                                              editQuizController.timeE = 30;
                                              editQuizController.selectIndexTimeE = index;
                                              editQuizController.update();
                                              editQuizController.updateQuestion(idQuestion,editQuizController.timeE,"time");
                                              editQuizController.updateQuestion(idQuestion, editQuizController.selectIndexTimeE,"index_time");
                                              editQuizController.update();
                                              break;
                                            case 6:
                                              editQuizController.timeE = 35;
                                              editQuizController.selectIndexTimeE = index;
                                              editQuizController.update();
                                              editQuizController.updateQuestion(idQuestion,editQuizController.timeE,"time");
                                              editQuizController.updateQuestion(idQuestion, editQuizController.selectIndexTimeE,"index_time");
                                              editQuizController.update();
                                              break;
                                            case 7:
                                              editQuizController.timeE = 40;
                                              editQuizController.selectIndexTimeE = index;
                                              editQuizController.update();
                                              editQuizController.updateQuestion(idQuestion,editQuizController.timeE,"time");
                                              editQuizController.updateQuestion(idQuestion, editQuizController.selectIndexTimeE,"index_time");
                                              editQuizController.update();
                                              break;
                                          } editQuizController.update();
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child:CorrectAnswerEdit(
                                            answer: editQuizController.correctAnswerE,
                                            answerColor: editQuizController.answerColorE,
                                            selectIndexCorrect: editQuizController.selectIndexCorrectE,
                                            answer1: editQuizController.answer1E.text,
                                            answer2: editQuizController.answer2E.text,
                                            answer3: editQuizController.answer3E.text,
                                            answer4: editQuizController.answer4E.text,
                                            onSelected: (s,index,b) async {
                                              String idQuestion = myServices.sharePref!.get("idQuestion").toString();
                                              switch (index) {
                                                case 0:
                                                  editQuizController.correctAnswerE = editQuizController.answer1E.text;
                                                  editQuizController.answerColorE = ColorC.redDark.value.toString();
                                                  editQuizController.selectIndexCorrectE = index;
                                                  editQuizController.updateCorrectAnswer(idQuestion,
                                                      editQuizController.correctAnswerE,
                                                      editQuizController.answerColorE,
                                                      editQuizController.selectIndexCorrectE);
                                                  editQuizController.update();
                                                  break;
                                                case 1:
                                                  editQuizController.correctAnswerE = editQuizController.answer2E.text;
                                                  editQuizController.answerColorE = ColorC.amberDark.value.toString();
                                                  editQuizController.selectIndexCorrectE = index;
                                                  editQuizController.updateCorrectAnswer(idQuestion,
                                                      editQuizController.correctAnswerE,
                                                      editQuizController.answerColorE,
                                                      editQuizController.selectIndexCorrectE);
                                                  editQuizController.update();
                                                  break;
                                                case 2:
                                                  editQuizController.correctAnswerE = editQuizController.answer3E.text;
                                                  editQuizController.answerColorE = ColorC.blueDark.value.toString();
                                                  editQuizController.selectIndexCorrectE = index;
                                                  editQuizController.updateCorrectAnswer(idQuestion,
                                                      editQuizController.correctAnswerE,
                                                      editQuizController.answerColorE,
                                                      editQuizController.selectIndexCorrectE);
                                                  editQuizController.update();
                                                  break;
                                                case 3:
                                                  editQuizController.correctAnswerE  = editQuizController.answer4E.text;
                                                  editQuizController.answerColorE  = ColorC.greenDark.value.toString();
                                                  editQuizController.selectIndexCorrectE = index;
                                                  editQuizController.update();
                                                  editQuizController.updateCorrectAnswer(idQuestion,
                                                      editQuizController.correctAnswerE,
                                                      editQuizController.answerColorE,
                                                      editQuizController.selectIndexCorrectE);
                                                  editQuizController.update();
                                                  break;
                                              }
                                              editQuizController.update();
                                            },
                                          ),
                                    )
                                  ],
                                ),
                                QuestionTextFieldEdit(
                                  controller: editQuizController.questionE,
                                  onChanged: (question) {
                                    editQuizController.questionE.text = question ;
                                    String idQuestion = myServices.sharePref!.getInt("idQuestion").toString();
                                    editQuizController.updateQuestion(idQuestion,question,"question");
                                    editQuizController.update();
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          MultiChooseEdit(
                                            color: ColorC.redDark,
                                            controller: editQuizController.answer1E,
                                            onChanged : (answer){
                                              editQuizController.answer1E.text = answer;
                                              String  idQuestion = myServices.sharePref!.get("idQuestion").toString();
                                              editQuizController.updateQuestion(idQuestion, answer,"answer1");
                                              editQuizController.update();
                                            }
                                          ),
                                          MultiChooseEdit(
                                            color: ColorC.amberDark,
                                            controller: editQuizController.answer2E,
                                              onChanged : (answer){
                                                editQuizController.answer2E.text = answer;
                                                String  idQuestion = myServices.sharePref!.get("idQuestion").toString();
                                                editQuizController.updateQuestion(idQuestion, answer,"answer2");
                                                editQuizController.update();
                                              }
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          MultiChooseEdit(
                                            color: ColorC.blueDark,
                                            controller: editQuizController.answer3E,
                                              onChanged : (answer){
                                                editQuizController.answer3E.text = answer;
                                                String  idQuestion = myServices.sharePref!.get("idQuestion").toString();
                                                editQuizController.updateQuestion(idQuestion, answer,"answer3");
                                                editQuizController.update();
                                              }
                                          ),
                                          MultiChooseEdit(
                                            color: ColorC.greenDark,
                                            controller: editQuizController.answer4E,
                                              onChanged : (answer){
                                                editQuizController.answer4E.text = answer;
                                                String  idQuestion = myServices.sharePref!.get("idQuestion").toString();
                                                editQuizController.updateQuestion(idQuestion, answer,"answer4");
                                                editQuizController.update();
                                              }
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                            });
                          }
                        },)
     );
   }
  }

