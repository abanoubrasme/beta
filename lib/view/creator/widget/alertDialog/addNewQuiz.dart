import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../control/creator/quizzesController.dart';
import '../../../../core/constant/widget/customTextButton.dart';
import '../../../../core/decoration/color.dart';
import '../../../../services/myServices.dart';
import '../TextField/customTextField.dart';

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
                        CustomTextField(
                          hintText: 'quiz name'.tr,
                          controller: quizzesController.nameC,
                          prefixIcon: const Icon(Icons.drive_file_rename_outline),
                          maxLength: 20,
                          keyboardType: TextInputType.name,
                          padding: const EdgeInsets.only(top: 20),
                          validator: (name){
                            return  quizzesController.validatorName(name!, 20, 2);
                          },
                          onChanged: (name) {
                           // formKey.currentState!.validate();
                            quizzesController.getCode();
                          },
                        ),
                        CustomTextField(
                          hintText: 'quiz code'.tr,
                          controller: quizzesController.codeC,
                          prefixIcon: const Icon(Icons.code),
                          maxLength: 10,
                          padding: const EdgeInsets.only(top: 10,bottom: 20),
                          validator: (code) {
                            return quizzesController.validatorName(code!,10, 4);
                          },
                          onChanged:(code) {
                            //formKey.currentState!.validate();
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
                                quizzesController.nameC.text = "";
                                quizzesController.codeC.text = "";
                                Get.back();
                              },
                              color: ColorC.redDark, padding: const EdgeInsets.symmetric(horizontal: 35),),
                            CustomTextButton(
                              text: "Create".tr,
                              fontSize: 20,
                              onPressed: () {
                                quizzesController.getCode();
                                print("================");
                                if(formKey.currentState!.validate()){
                                  String idUser =  myServices.sharePref!.get("id_user").toString();
                                  quizzesController.addName(quizzesController.nameC.text, quizzesController.codeC.text, idUser);
                                  quizzesController.update();
                                  Get.back();
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
