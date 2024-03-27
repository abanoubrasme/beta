import 'package:beta/control/auth/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/auth/helperController.dart';
import '../../../control/auth/signUpController.dart';
import '../../../core/constant/widget/customText.dart';
import '../../../services/myServices.dart';
import '../../creator/widget/TextField/customTextField.dart';
import '../widget/loginButton.dart';
import '../widget/signUpTextButton.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  SignUpController signUpController = Get.put(SignUpController());
//  Helper helper = Get.put(Helper());
  MyServices myServices = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
        builder: (signUpController){
          return Scaffold(
          body: Form(
            key: formKey,
            child: ListView(
              children: [
                CustomText(text: "Sign Up".tr,
                   style: context.textTheme.titleSmall,
                   padding: const EdgeInsets.only(top: 30),
                 ),
                SizedBox(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: Image.asset('image/on2.png',fit: BoxFit.fill),
                    )),
                CustomTextField(
                     hintText: 'user name'.tr,
                     prefixIcon: const Icon(
                     Icons.person_outline_outlined,
                  ),
                     controller: signUpController.userName,
                     padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                     obscureText: false,
                     enableSuggestions: true,
                     onChanged: (name){
                       signUpController.getUserName();
                     },
                     validator: (s) {
                        return signUpController.validator(s!, 15, 3);
                      },

                ),
                CustomTextField(
                     hintText: 'email'.tr,
                     prefixIcon: const Icon(
                       Icons.email_outlined,
                     ),
                     controller: signUpController.email,
                     obscureText: false,
                     enableSuggestions: true,
                     padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                     validator: (s) {
                       return signUpController.validator(s!, 40, 3);
                     },
                ),
                CustomTextField(
                        hintText: 'password'.tr,
                        controller: signUpController.password,
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: SizedBox(
                          width: 55,
                          child: MaterialButton(
                            onPressed: (){
                              signUpController.showPassword();
                            },
                            child: Icon(
                                signUpController.obscure ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                                color: Colors.grey.shade500),),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                        validator: (s) {
                          return signUpController.validator(s!, 15, 3);
                        },
                        obscureText: !signUpController.obscure,
                        enableSuggestions: signUpController.obscure,
                      ),
                LoginButton(
                  padding: const EdgeInsets.only(top: 50,left: 50,right: 50),
                  text: "Sign Up".tr,
                  onPressed: () {

                    signUpController.update();
                    if(formKey.currentState!.validate()){
                      myServices.sharePref!.setString("userName", signUpController.userName.text);
                      myServices.sharePref!.setString("email"   , signUpController.email.text);
                      myServices.sharePref!.setString("password", signUpController.password.text);
                      signUpController.signUp(
                        signUpController.userName.text,
                        signUpController.email.text,
                        signUpController.password.text,
                      );
                    }
                    },
                ),
                SignUpButton(
                  text: "Do you have an account?".tr,
                  textButton:  "Login".tr,
                  onPressed: () { Get.offNamed("/login"); }, ),
              ],
            ),
          ),
        );
        });
  }
}
