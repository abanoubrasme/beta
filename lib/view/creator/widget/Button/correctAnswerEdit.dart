import 'package:beta/control/creator/editQuizController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

import '../../../../core/decoration/color.dart';


class CorrectAnswerEdit extends StatelessWidget {

  String answer ;
  String answerColor ;
  int selectIndexCorrect;
  String answer1;
  String answer2;
  String answer3;
  String answer4;
  EditQuizController editQuizController = Get.put(EditQuizController());
  dynamic Function(String, int, bool)? onSelected;

  CorrectAnswerEdit({super.key,
    required this.answer,
    required this.answerColor,
    required this.selectIndexCorrect,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: Container(
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color(int.parse(answerColor)),
                borderRadius: BorderRadius.circular(5),
              ),
              child: MaterialButton(
                      child:  Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(answer,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )),
                      onPressed: () {
                        Get.defaultDialog(
                            title:"",
                            backgroundColor: Colors.white.withOpacity(0),
                            content: GetBuilder<EditQuizController>(builder: (editQuizController){
                              return  GroupButton(
                                controller: GroupButtonController(
                                  selectedIndex: editQuizController.selectIndexCorrectE,
                                ),
                                options: GroupButtonOptions(
                                  unselectedColor: ColorC.white,
                                  selectedColor:Color(int.parse(editQuizController.answerColorE)),
                                  alignment: Alignment.center,
                                  borderRadius: BorderRadius.circular(5),
                                  buttonHeight: 100,
                                  buttonWidth: 120,
                                  textAlign: TextAlign.center,
                                  textPadding: const EdgeInsets.all(5),
                                ),
                                buttons: [
                                  answer1,
                                  answer2,
                                  answer3,
                                  answer4,
                                ],
                                onSelected: onSelected,
                              );
                            })
                        );
                      },
                    ),
            ),
    );
  }
}