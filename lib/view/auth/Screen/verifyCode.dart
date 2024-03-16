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
                  const SizedBox(height: 40,),
                  CustomText(text: "Verification Code".tr,
                      fontSize: 25, color: ColorC.grey, padding: const EdgeInsets.symmetric(horizontal: 20.0),),
                  const SizedBox(height: 50,),
                  CustomText(text: "Check Code".tr, fontSize: 35, color: ColorC.grey2, padding: const EdgeInsets.symmetric(horizontal: 20.0),),
                  const SizedBox(height: 30,),
                  CustomText(text:"Please enter the digit code sent to your email".tr,
                      fontSize: 15, color:  ColorC.grey, padding: const EdgeInsets.symmetric(horizontal: 20.0),),
                  const SizedBox(height: 30,),
                  OtpTextField(
                    fieldWidth: 50,
                    numberOfFields: 5,
                    borderColor:ColorC.grey2,
                    focusedBorderColor: ColorC.teal,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {
                    },
                    onSubmit: (String verificationCode){
                      showDialog(
                          context: context,
                          builder: (context){
                            return  AlertDialog(
                              title: const Center(child:  Text("check Code")),
                              content: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 90.0),
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
