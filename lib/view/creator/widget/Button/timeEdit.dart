import 'package:beta/control/creator/editQuizController.dart';
import 'package:beta/core/decoration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import '../../../../core/constant/widget/customText.dart';
import '../../../../services/myServices.dart';

class TimeButtonEdit extends StatelessWidget {

  int time ;
  int selectIndexTime ;
  dynamic Function(String , int, bool)? onSelected;

  TimeButtonEdit({super.key,
    required this.time,
    required this.selectIndexTime,
    required this.onSelected
  });

  MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 10),
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
                    const Icon(
                      Icons.watch_later_outlined,
                      color: Colors.white,
                    ),
                    Text("  $time ${" Second".tr}" ,
                     style: TextStyle(color: ColorC.white,fontSize: 20)
                    ),
                  ],
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
                          selectedColor: context.theme.canvasColor,
                          unselectedColor: ColorC.white,
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
                        onSelected: onSelected,
                      )
                  );
                },

              ),
      ),
    );


  }
}
