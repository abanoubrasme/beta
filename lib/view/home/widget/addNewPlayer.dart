import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/creator/nameQuizController.dart';
import '../../../control/player/playerController.dart';
import '../../../core/constant/widget/customButton.dart';
import '../../../core/decoration/color.dart';
import '../../../core/decoration/font.dart';
import '../../player/widget/namePlayerTextField.dart';

class AddNewPlayer {
   AddNewPlayer();

   PlayerController playerController = Get.put(PlayerController());
   NameOfQuizController nameOfQuizController = Get.put(NameOfQuizController());
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future alert(){
  return   Get.defaultDialog(
    contentPadding: EdgeInsets.zero,
    title:  "BeTa",
    titlePadding: const EdgeInsets.symmetric(vertical: 15),
    titleStyle: const TextStyle(fontFamily: Font.f3,fontSize: 50,
        //color: ColorC.teal,
        fontWeight: FontWeight.w600),
    content: SizedBox(
      width: 350,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NamePlayerTextField(
              controller: playerController.nameP,
              labelText: 'enter your name'.tr,
              prefixIcon: const Icon(Icons.person_outline_outlined),
            ),
            NamePlayerTextField(
              labelText: 'enter the code'.tr,
              maxLength: 8,
              controller: nameOfQuizController.codeC,
              prefixIcon: const Icon(Icons.code),
              keyboardType: TextInputType.number,
              onChanged: (s){
                nameOfQuizController.getCode();
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
    ),

  );
}

}



