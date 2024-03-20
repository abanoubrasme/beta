import 'package:beta/control/auth/forgetController.dart';
import 'package:beta/view/auth/widget/loginButton.dart';
import 'package:beta/core/constant/widget/customText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/auth/helperController.dart';
import '../../../services/myServices.dart';
import '../../creator/widget/TextField/customTextField.dart';
import '../widget/signUpTextButton.dart';

class Forget extends StatelessWidget {
  Forget({Key? key}) : super(key: key);
  ForgetController forgetController = Get.put(ForgetController());
  Helper helper = Get.put(Helper());
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
                  CustomText(text: "Forget password".tr, style: context.textTheme.titleSmall,
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),),
                  CustomText(
                      text: "Please enter your email address you would like your password reset information sent to".tr,
                    style: context.textTheme.titleSmall,
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),),
                  CustomTextField(
                    hintText: 'email'.tr,
                    prefixIcon:    const Icon(
                      Icons.email_outlined,
                    ),
                    padding: const EdgeInsets.only(right: 15,left: 15, top: 15,bottom: 60),
                    controller: forgetController.email,
                    validator: (s) {
                      return forgetController.validLogin(helper.validator);
                    },
                  ),
                  LoginButton(
                    text: "Request reset a link".tr,
                    onPressed: () {
                      Get.offNamed( "/verifyCode");
                    },),
                  const SizedBox(height: 20,),
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
