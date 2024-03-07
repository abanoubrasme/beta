import 'package:beta/control/auth/forgetController.dart';
import 'package:beta/view/auth/Screen/verifyCode.dart';
import 'package:beta/view/auth/widget/loginButton.dart';
import 'package:beta/view/auth/widget/loginTextField.dart';
import 'package:beta/view/auth/widget/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/auth/helperController.dart';
import '../../../core/decoration/Colors.dart';
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
                  CustomText(text: "Forget password".tr, fontSize: 35, color: ColorC.grey2),
                  const SizedBox(height: 30,),
                  CustomText(
                      text: "     Please enter your email address you would like your password reset information sent to".tr,
                      fontSize: 15, color: ColorC.grey),
                  const SizedBox(height: 30,),
                  LoginTextField(
                    labelText: 'email',
                    prefixIcon:    const Icon(
                      Icons.email_outlined,
                    ),
                    controller: forgetController.email,
                    val: (s) {
                      return forgetController.validLogin(helper.validator);
                    },
                    obscureText: false, enableSuggestions: true,
                  ),
                  const SizedBox(height: 50,),
                  LoginButton(
                    text: "Request reset link".tr,
                    onPressed: () {
                      Get.to( const VerifyCode());
                    },),

                  const SizedBox(height: 20,),
                  SignUpTextButton(
                      textButton: "Back to Login".tr,
                      onPressed: () {
                          Get.toNamed("/login");
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