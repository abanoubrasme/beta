import 'package:beta/control/auth/loginController.dart';
import 'package:beta/view/auth/widget/loginButton.dart';
import 'package:beta/view/auth/widget/loginTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/auth/helperController.dart';
import '../../../core/constant/widget/customButton.dart';
import '../../../core/decoration/color.dart';
import '../../../services/myServices.dart';
import '../../creator/widget/TextField/customTextField.dart';
import '../widget/forgetPassword.dart';
import '../widget/signUpTextButton.dart';
import '../../../core/constant/widget/customText.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());
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
               CustomText(text: "Login".tr,style: context.textTheme.titleSmall,
                 padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),),
               CustomText(text: 'Welcome to BeTa'.tr, style: context.textTheme.titleMedium,
                 padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
               ),
               CustomTextField(
                hintText: 'user name'.tr,
                prefixIcon:  const Icon(Icons.person_outline_outlined,),
                controller: loginController.userName,
                padding: const EdgeInsets.symmetric(horizontal:15,vertical: 10 ),
                validator: (s) {
                  return loginController.validLogin(helper.validator);
                },
                onChanged: (s){
                  loginController.getUserName();
                  loginController.checkEP();
                },

              ),
               CustomTextField(
                hintText: 'password'.tr,
                prefixIcon:   const Icon(Icons.lock_outline,),
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
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                obscureText: !helper.obscure,
                enableSuggestions: helper.obscure,
                onChanged: (s){
                  loginController.getUserName();
                  loginController.checkEP();
                },
                controller: loginController.password,
                validator: (s) {
                  return loginController.validLogin(helper.validator);
                },

              ),
              const ForgetPassword(),
              const SizedBox(height: 50,),
              LoginButton(
                 text: "Login".tr,
                 onPressed: () {
                      if(formKey.currentState!.validate()){
                      myServices.sharePref!.setString("userName", loginController.userName.text);
                      myServices.sharePref!.setString("password", loginController.password.text);
                      loginController.login();
                      loginController.getIdUser();
                      }
             }
           ),
              SignUpButton(
                text: 'Do you want create a new account?'.tr,
                textButton: 'Sign Up'.tr,
                onPressed: () {
                  Get.offNamed("/signUp");
                  }, ),
              const SizedBox(height: 25,),
            ],
          ),
        ),
      );
    });

  }
}
