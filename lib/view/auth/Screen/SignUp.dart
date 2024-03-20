import 'package:beta/control/auth/AuthController.dart';
import 'package:beta/view/auth/widget/loginTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/auth/helperController.dart';
import '../../../core/constant/widget/customText.dart';
import '../../../core/decoration/font.dart';
import '../../../services/myServices.dart';
import '../../creator/widget/TextField/customTextField.dart';
import '../widget/loginButton.dart';
import '../widget/signUpTextButton.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  AuthController authController = Get.put(AuthController());
  Helper helper = Get.put(Helper());
  MyServices myServices = Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Helper>(
        builder: (helper){
          return Scaffold(
          body: Form(
            key: formKey,
            child: ListView(
              children: [
                   CustomText(text: "Sign Up".tr,
                   style: context.textTheme.titleSmall,
                   padding: const EdgeInsets.symmetric(vertical: 30),
                 ),
                   CustomText(text: "Welcome to BeTa".tr, style: context.textTheme.titleMedium,
                     padding: const EdgeInsets.symmetric(vertical: 20),
                 ),
                   CustomTextField(
                  hintText: 'user name'.tr,
                  prefixIcon: const Icon(
                    Icons.person_outline_outlined,
                  ),
                  controller: authController.userName,
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                  obscureText: false,
                  enableSuggestions: true,
                  validator: (s) {
                    return authController.validator(s!, 15, 3);
                  },

                ),
                   CustomTextField(
                  hintText: 'email'.tr,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                  ),
                  controller: authController.email,
                  obscureText: false,
                  enableSuggestions: true,
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                  validator: (s) {
                    return authController.validator(s!, 40, 3);
                  },
                ),
                   CustomTextField(
                  hintText: 'password'.tr,
                  controller: authController.password,
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: SizedBox(
                    width: 55,
                    child: MaterialButton(
                      onPressed: (){
                        helper.showPassword();
                      },
                      child: Icon(
                          helper.obscure ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                          color: Colors.grey.shade500),),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                  validator: (s) {
                    return authController.validator(s!, 15, 3);
                  },
                  obscureText: !helper.obscure,
                  enableSuggestions: helper.obscure,
                ),
                const SizedBox(height: 70,),
                LoginButton(
                    text: "Sign Up".tr,
                  onPressed: () {
                    authController.getEmail();
                    helper.update();
                    if(formKey.currentState!.validate()){
                      myServices.sharePref!.setString("userName", authController.userName.text);
                      myServices.sharePref!.setString("email", authController.email.text);
                      myServices.sharePref!.setString("password", authController.password.text);
                      authController.signUp(
                        authController.userName.text,
                        authController.email.text,
                        authController.password.text,
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
