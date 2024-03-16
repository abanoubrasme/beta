import 'package:beta/control/auth/forgetController.dart';
import 'package:beta/view/auth/Screen/verifyCode.dart';
import 'package:beta/view/auth/widget/loginButton.dart';
import 'package:beta/view/auth/widget/loginTextField.dart';
import 'package:beta/core/constant/widget/customText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/auth/helperController.dart';
import '../../../core/decoration/color.dart';
import '../../../services/myServices.dart';
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

                  const SizedBox(height: 50,),
                  CustomText(text: "Forget password".tr, fontSize: 35, color: ColorC.grey2, padding: const EdgeInsets.symmetric(horizontal: 20.0),),
                  const SizedBox(height: 30,),
                  CustomText(
                      text: "     Please enter your email address you would like your password reset information sent to".tr,
                      fontSize: 15, color: ColorC.grey, padding: const EdgeInsets.symmetric(horizontal: 20.0),),
                  const SizedBox(height: 30,),
                  LoginTextField(
                    labelText: 'email'.tr,
                    prefixIcon:    const Icon(
                      Icons.email_outlined,
                    ),
                    controller: forgetController.email,
                    validator: (s) {
                      return forgetController.validLogin(helper.validator);
                    },
                    obscureText: false, enableSuggestions: true,
                  ),
                  const SizedBox(height: 50,),
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
                          },
                      text: '', ),

                  const SizedBox(height: 25,),
                ],
              ),
            ),
          );
        });

  }
}
