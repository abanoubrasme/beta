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
   // backgroundColor:ColorC.amberDark,
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
                    hintText: 'enter your name'.tr,
                    prefixIcon: const Icon(Icons.person_outline_outlined),
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  ),
                  CustomTextField(
                    hintText: 'enter the code'.tr,
                    maxLength: 8,
                    controller: nameOfQuizController.codeC,
                    prefixIcon: const Icon(Icons.code),
                    keyboardType: TextInputType.number,
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    onChanged: (s){
                      nameOfQuizController.getCode();
                      nameOfQuizController.update();
                    },
                    validator: (code) {
                      return nameOfQuizController.validatorCode(code!);
                    },

                  ),
                  CustomButton(
                    text: 'Connect'.tr,
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        nameOfQuizController.getCodeCheck(nameOfQuizController.codeC.text);}
                    }, )
                ],
              ),
            ),
          );
    })

  );
}

}



