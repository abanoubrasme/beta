import 'package:beta/core/constant/widget/customButton.dart';
import 'package:beta/core/constant/widget/customText.dart';
import 'package:beta/view/auth/widget/signUpTextButton.dart';
import 'package:beta/view/creator/widget/indexContainer.dart';
import 'package:beta/view/creator/widget/nameQuiz.dart';
import 'package:beta/view/creator/widget/slideBackground.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/font.dart';
import '../../../core/decoration/Colors.dart';
import '../../../services/myServices.dart';

class CardListTitle extends StatelessWidget {

  MyServices myServices = Get.put(MyServices());

   CardListTitle({super.key,
     required this.keys,
     required this.setIdUser,
     required this.onPressedDelete,
     required this.index,
     required this.nameQuiz});

    Key keys;
   final int setIdUser;
   final int index;
   final String nameQuiz;
   final void Function()? onPressedDelete;
  @override
  Widget build(BuildContext context) {
    return  Card(
        shadowColor:ColorC.grey2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 8,
      child: Dismissible(
          movementDuration: const Duration(milliseconds: 1000),
          resizeDuration: const Duration(milliseconds: 1000),
          background: SlideBackground(
            color: ColorC.green,
            text: 'Edit',
            icon: Icons.edit,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 18, bottom: 20, left: 30),),
          secondaryBackground: SlideBackground(
            color: ColorC.red,
            text: 'Delete',
            icon: Icons.delete,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(top: 18, bottom: 20, right: 30),),
          key: keys,
          onDismissed: (direction) {},
          confirmDismiss: (direction) async {
            myServices.sharePref!.setInt("idQuiz",setIdUser) ;
            if (direction == DismissDirection.endToStart) {
              return Get.defaultDialog(
                titlePadding: EdgeInsets.zero,
                title: "",
                content: CustomText(
                    text: "Are you sure you want to delete this quiz?".tr,
                    fontSize: 22, color: ColorC.grey2),
                actions: <Widget>[
                  CustomTextButton(
                    text: "Cancel".tr,
                    fontSize: 20,
                    onPressed: (){
                      Get.back();
                      },
                    color: ColorC.black,),
                  CustomTextButton(
                    text: "Delete".tr,
                    fontSize: 20,
                    onPressed: onPressedDelete,
                    color: ColorC.red,)
                ],
              );
            }
          },
          child: Row(
            children: [
             IndexContainer(index: index),
             NameQuiz(name: nameQuiz,)
            ],)
      ),
    );
  }
}
