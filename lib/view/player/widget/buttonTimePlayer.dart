import 'package:beta/core/decoration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../../../../control/creator/quizController.dart';

class ButtonTimePlayer extends StatelessWidget {

  int time ;
  Function? onFinished;
  CountdownController controller =  CountdownController(autoStart: true);

  ButtonTimePlayer({super.key,
    required this.time,
    required this.controller,
    required this.onFinished,
  });
  QuizController quizController =Get.put(QuizController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
        builder: (quizController){
          return   Padding(
            padding: const EdgeInsets.symmetric(horizontal: 110),
            child: Container(
                height: 60,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: context.theme.canvasColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: ColorC.white,
                    ),
                    Countdown(
                      controller: controller,
                      seconds: time,
                      build: (BuildContext context, double time) {
                        // if(time == 0.0 ){
                        //
                        //   controller.restart();
                        // }

                       print(time);
                        return  Text("  $time ${" Second".tr}" ,
                          style: const TextStyle(fontSize: 18, color: Colors.white),
                        );
                      },
                      interval: const Duration(seconds: 1),
                      onFinished: onFinished,
                    ),

                  ],
                ),
              ),
          );
        });
  }
}
