import 'package:beta/control/creator/editQuizController.dart';
import 'package:beta/core/decoration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import '../../../../core/constant/widget/customText.dart';
import '../../../../services/myServices.dart';

class TimeEdit extends StatelessWidget {

  int time ;
  int selectIndexTime ;
  dynamic Function(String , int, bool)? onSelected;

  TimeEdit({super.key,
    required this.time,
    required this.selectIndexTime,
    required this.onSelected
  });

  //EditQuizController editQuizController = Get.put(EditQuizController());
  MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
            child: Container(
              height: 50,
              margin:
              const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: ColorC.teal,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: ColorC.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(2, 4)),
                  ]),
              child:  Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.watch_later_outlined,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8,),
                      CustomText(text:"$time  Second" ,
                       fontSize: 20, color: Colors.white, padding: EdgeInsets.zero,
                      ),
                    ],
                  )),
            ),
            onPressed: () {
              Get.defaultDialog(
                  backgroundColor: Colors.white.withOpacity(0),
                  title: "",
                  content:  GroupButton(
                    controller: GroupButtonController(
                      selectedIndex:selectIndexTime,
                    ),
                    options: GroupButtonOptions(
                      alignment: Alignment.center,
                      borderRadius: BorderRadius.circular(5),
                      buttonHeight: 50,
                      buttonWidth: 100,
                      textAlign: TextAlign.center,
                      textPadding: const EdgeInsets.all(5),
                    ),
                    buttons: const [
                      "5 Second",
                      "10 Second",
                      "15 Second",
                      "20 Second",
                      "25 Second",
                      "30 Second",
                      "35 Second",
                      "40 Second",
                    ],
                    onSelected: onSelected,
                  )
              );
            },

          );


  }
}
