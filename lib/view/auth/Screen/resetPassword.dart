import 'package:beta/control/auth/forgetController.dart';
import 'package:beta/view/auth/widget/loginButton.dart';
import 'package:beta/core/constant/widget/customText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/auth/helperController.dart';
import '../../../control/auth/signUpController.dart';
import '../../../core/decoration/color.dart';
import '../../../services/myServices.dart';
import '../../creator/widget/TextField/customTextField.dart';
import '../widget/signUpTextButton.dart';

class Reset extends StatelessWidget {
  Reset({Key? key}) : super(key: key);
  ForgetController forgetController = Get.put(ForgetController());
  SignUpController signUpController = Get.put(SignUpController());
  MyServices myServices = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<Helper>(
        builder: (helper){
          return Scaffold(
            body: Form(
              key: formKey,
              child: ListView(
                children: [
                  SizedBox(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: Image.asset('image/Reset.png',fit: BoxFit.fill),
                      )),
                  CustomText(text: "Reset password".tr, style: context.textTheme.titleSmall,
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),),
                  CustomText(
                    text: "Enter a new password for abanoub@gmail.com".tr,
                    style: TextStyle(color: ColorC.grey2,fontSize: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),),
                  CustomTextField(
                    hintText: 'password'.tr,
                    prefixIcon: const Icon(Icons.email_outlined,),
                    padding: const EdgeInsets.only(right: 15,left: 15, top: 15,bottom: 5),
                    controller: forgetController.email,
                    validator: (s) {
                      return forgetController.validLogin(helper.validator);
                    },
                  ),
                  CustomTextField(
                    hintText: 'confirm password'.tr,
                    prefixIcon:const Icon(Icons.email_outlined,),
                    padding: const EdgeInsets.only(right: 15,left: 15, top: 5,bottom: 60),
                    controller: forgetController.email,
                    validator: (s) {
                      return forgetController.validLogin(helper.validator);
                    },
                  ),
                  LoginButton(
                    padding: const EdgeInsets.only(bottom: 10 , left: 50 ,right: 50),
                    text: "reset a password".tr,
                    onPressed: () {
                      Get.offNamed( "/login");
                    },),
                  SignUpButton(
                    textButton: "Back to Login".tr,
                    onPressed: () {
                      Get.offNamed("/login");
                    }, text: '', ),
                ],
              ),
            ),
          );
        });

  }
}
