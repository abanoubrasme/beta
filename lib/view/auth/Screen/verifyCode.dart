import 'package:beta/view/auth/widget/loginButton.dart';
import 'package:beta/view/auth/widget/signUpTextButton.dart';
import 'package:beta/core/constant/widget/customText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../core/decoration/color.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            body: Form(
              child: ListView(
                children: [
                  // CustomText(text: "Verification Code".tr,
                  //     style: context.textTheme.titleSmall,
                  //     padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30)),
                  CustomText(text: "Check Code".tr,
                    style: context.textTheme.titleMedium,
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),),
                  CustomText(text:"Please enter the digit code sent to your email".tr,
                      style: context.textTheme.titleSmall,
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),),
                  const SizedBox(height: 30,),
                  OtpTextField(
                    fieldWidth: 50,
                    numberOfFields: 5,
                    textStyle: TextStyle(color: ColorC.grey2,fontSize: 20),
                    borderColor:ColorC.grey2,
                    focusedBorderColor: context.theme.canvasColor,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {
                    },
                    onSubmit: (String verificationCode){
                      showDialog(
                          context: context,
                          builder: (context){
                            return  AlertDialog(
                              title:  Center(child:  Text("check Code".tr)),
                              content: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                                child: CircularProgressIndicator(
                                  color: ColorC.teal,
                                ),
                              ),
                            );
                          }
                      );
                    }, // end onSubmit
                  ),
                  const SizedBox(height: 50,),
                  LoginButton(
                      text: "Request reset a link".tr,
                    onPressed: () {  } ,),
                  const SizedBox(height: 20,),
                  SignUpButton(text: '',
                    textButton:  "Back to Login".tr,
                    onPressed: () {  Get.offNamed("/login"); },
                    ),

                ],
              ),
            ),
          );


  }
}
