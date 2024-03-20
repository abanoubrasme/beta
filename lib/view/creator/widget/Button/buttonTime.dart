import 'package:beta/core/decoration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import '../../../../control/creator/quizController.dart';
import '../../../../core/decoration/font.dart';

class ButtonTime extends StatelessWidget {

   int time ;
   int selectIndexTime ;

   ButtonTime({super.key,
     required this.time,
     required this.selectIndexTime});

   QuizController quizController =Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
        builder: (quizController){
        return  Expanded(
          child: Container(
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 10,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: MaterialButton(
              color: context.theme.canvasColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                //   side: BorderSide(color: Theme.of(context).primaryColor),
              ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Icon(
                      Icons.watch_later_outlined,
                      color: ColorC.white,
                    ),
                     Text("  $time ${" Second".tr}" ,
                         style: TextStyle(color: ColorC.white,fontSize: 20),
                    ),
                  ],
                ),
                onPressed: () {
                  Get.defaultDialog(
                    backgroundColor: ColorC.grey3.withOpacity(0),
                    title: "",
                    titlePadding: EdgeInsets.zero,
                    content:  GroupButton(
                      controller: GroupButtonController(
                        selectedIndex:selectIndexTime,
                      ),
                      options: GroupButtonOptions(
                        unselectedColor: ColorC.white,
                        selectedColor: context.theme.canvasColor,
                        alignment: Alignment.center,
                        borderRadius: BorderRadius.circular(5),
                        buttonHeight: 50,
                        buttonWidth: 100,
                        textAlign: TextAlign.center,
                        textPadding: const EdgeInsets.all(5),
                      ),
                      buttons:  [
                        "5 Second".tr,
                        "10 Second".tr,
                        "15 Second".tr,
                        "20 Second".tr,
                        "25 Second".tr,
                        "30 Second".tr,
                        "35 Second".tr,
                        "40 Second".tr,
                      ],
                      onSelected: (s, index, b) async {
                        switch (index) {
                          case 0:
                            time = 5;
                            selectIndexTime = index ;
                            quizController.time = 5;
                            quizController.selectIndexTime = index;
                            quizController.update();
                            break;
                          case 1:
                            time = 10;
                            selectIndexTime = index ;
                            quizController.time = 10;
                            quizController.selectIndexTime = index;
                            quizController.update();
                            break;
                          case 2:
                            time = 15;
                            selectIndexTime = index ;
                            quizController.time = 15;
                            quizController.selectIndexTime = index;
                            quizController.update();
                            break;
                          case 3:
                            time = 20;
                            selectIndexTime = index ;
                            quizController.time = 20;
                            quizController.selectIndexTime = index;
                            quizController.update();
                            break;
                          case 4:
                            time = 25;
                            selectIndexTime = index ;
                            quizController.time = 25;
                            quizController.selectIndexTime = index;
                            quizController.update();
                            break;
                          case 5:
                            time = 30;
                            selectIndexTime = index ;
                            quizController.time = 30;
                            quizController.selectIndexTime = index;
                            quizController.update();
                            break;
                          case 6:
                            time = 35;
                            selectIndexTime = index ;
                            quizController.time = 35;
                            quizController.selectIndexTime = index;
                            quizController.update();
                            break;
                          case 7:
                            time = 40;
                            quizController.time = 40;
                            selectIndexTime = index ;
                            quizController.selectIndexTime = index;
                            quizController.update();
                            break;
                        } quizController.update();
                      },
                    )
                  );
                },
              ),
          ),
        );
        });
  }
}
// margin: const EdgeInsets.symmetric(horizontal: 10),
// decoration: BoxDecoration(
// color: ColorC.tealDark,
// borderRadius: BorderRadius.circular(5)
// ),