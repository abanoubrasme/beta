import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/creator/nameQuizController.dart';
import '../../../control/player/playerController.dart';
import '../../../core/constant/widget/customButton.dart';
import '../../creator/widget/TextField/customTextField.dart';

class AddNewPlayer {
   AddNewPlayer();

   PlayerController playerController = Get.put(PlayerController());
   NameOfQuizController nameOfQuizController = Get.put(NameOfQuizController());
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future alert(BuildContext context){
  return   Get.defaultDialog(
    contentPadding: EdgeInsets.zero,
    title:  "connect to quiz".tr,
    titlePadding: const EdgeInsets.symmetric(vertical: 20),
    content: GetBuilder<NameOfQuizController>(
        builder: (nameOfQuizController){
          return  SizedBox(
            width: 350,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    controller: playerController.nameP,
                    hintText: 'quiz name'.tr,
                    prefixIcon: const Icon(Icons.person_outline_outlined),
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    validator: (name){
                      return playerController.validatorName(name!);
                    },
                  ),
                  CustomTextField(
                    hintText: 'quiz code'.tr,
                    maxLength: 8,
                    controller: playerController.codeP,
                    prefixIcon: const Icon(Icons.code),
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    onChanged: (code){
                      playerController.getCode();
                    },
                    validator: (code) {
                      return playerController.validatorCode(code!);
                    },

                  ),
                  CustomButton(
                    text: 'Connect'.tr,
                    onPressed: () {
                    //  playerController.update();
                      if(formKey.currentState!.validate()){
                        playerController.getCodeCheck(playerController.codeP.text,playerController.nameP.text);

                      }
                    }, )
                ],
              ),
            ),
          );
    })

  );
}

}



