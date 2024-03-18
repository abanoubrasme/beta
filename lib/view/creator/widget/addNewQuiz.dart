import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/creator/quizzesController.dart';
import '../../../core/constant/widget/customTextButton.dart';
import '../../../core/decoration/color.dart';
import '../../../core/decoration/font.dart';
import '../../../services/myServices.dart';
import 'TextField/nameQuizTextField.dart';

class AddNewQuiz extends StatelessWidget {
   AddNewQuiz({super.key});

  QuizzesController quizzesController = Get.put(QuizzesController());
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        Get.defaultDialog(
          barrierDismissible: false,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          title: "Add new quiz".tr,
          titlePadding:  const EdgeInsets.symmetric(vertical: 15),
          content: GetBuilder<QuizzesController>(
              builder: (quizzesController){
                return  SizedBox(width: 350,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NameQuizTextField(
                          labelText: 'quiz name'.tr,
                          controller: quizzesController.nameC,
                          icon: const Icon(Icons.drive_file_rename_outline),
                          maxLength: 20,
                          keyboardType: TextInputType.name,
                          padding: const EdgeInsets.only(top: 20),
                          valid: (name){
                            return  quizzesController.validatorName(name!, 20, 2);
                          },
                          // onChanged: (name) {
                          //   quizzesController.name = name ;
                          // },
                        ),
                        NameQuizTextField(
                          labelText: 'quiz code'.tr,
                          controller: quizzesController.codeC,
                          icon: const Icon(Icons.code),
                          maxLength: 8,
                          keyboardType: TextInputType.number,
                          padding: const EdgeInsets.only(top: 10,bottom: 20),
                          valid: (code) {
                            return quizzesController.validatorName(code!, 8, 4);
                          },
                          onChanged:(code) {
                              quizzesController.code = int.parse(code)  ;
                              quizzesController.getCode();
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextButton(
                              text: "Cancel".tr,
                              fontSize: 20,
                              onPressed: (){
                                Get.back();
                              },
                              color: ColorC.redDark, padding: const EdgeInsets.symmetric(horizontal: 35),),
                            CustomTextButton(
                              text: "Create".tr,
                              fontSize: 20,
                              onPressed: () {
                                quizzesController.getCode();
                                quizzesController.update();
                                if(formKey.currentState!.validate()){
                                  var idUser =  myServices.sharePref!.get("id_user").toString();
                                  quizzesController.addName(quizzesController.name, quizzesController.code, idUser);
                                  Get.back();
                                  quizzesController.update();
                                }
                                quizzesController.update();
                              },
                              color: ColorC.greenDark, padding: const EdgeInsets.symmetric(horizontal: 35),),
                          ],)
                      ],
                    ),
                  ),
                );
              }),
        );
      },
      icon:  Icon(Icons.add,color: ColorC.grey,),
      iconSize: 30,
    );
  }
}
