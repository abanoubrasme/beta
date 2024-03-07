import 'package:beta/control/auth/loginController.dart';
import 'package:beta/view/auth/Screen/forgetPassword.dart';
import 'package:beta/view/auth/widget/loginButton.dart';
import 'package:beta/view/auth/widget/loginTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../control/auth/AuthController.dart';
import '../../../control/auth/helperController.dart';
import '../../../core/constant/font.dart';
import '../../../core/decoration/Colors.dart';
import '../../../services/myServices.dart';
import '../widget/forgetPassword.dart';
import '../widget/signUpTextButton.dart';
import '../widget/welcome.dart';

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
              const SizedBox(height: 30,),
               CustomText(text: "Login", fontSize: 22, color: ColorC.grey),
              const SizedBox(height: 50,),
               CustomText(text: 'Welcome to BeTa', fontSize: 40, color: ColorC.grey2,
               ),
              const SizedBox(height: 30,),
              LoginTextField(
                labelText: 'user name',
                prefixIcon:  const Icon(
                  Icons.person_outline_outlined,
                ),
                controller: loginController.userName,
                val: (s) {
                  return loginController.validLogin(helper.validator);
                },
                onChange: (s){
                  loginController.getUserName();
                  loginController.checkEP();
                },
                obscureText: false, enableSuggestions: true,
              ),
              LoginTextField(
                labelText: 'password',
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
                onChange: (s){
                  loginController.getUserName();
                  loginController.checkEP();
                },
                controller: loginController.password,
                val: (s) {
                  return loginController.validLogin(helper.validator);
                },
                obscureText: !helper.obscure,
                enableSuggestions: helper.obscure,
              ),
              const ForgetPassword(),
              const SizedBox(
                height: 50,
              ),
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
              SignUpTextButton(
                text: 'Do you create a new account?'.tr,
                textButton: 'Sign Up',
                onPressed: () { Get.toNamed("/signUp"); }, ),
              const SizedBox(height: 25,),
            ],
          ),
        ),
      );
    });

  }
}