import 'package:beta/control/auth/loginController.dart';
import 'package:beta/view/auth/widget/loginButton.dart';
import 'package:beta/view/auth/widget/loginTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/myServices.dart';
import '../../creator/widget/TextField/customTextField.dart';
import '../widget/forgetPassword.dart';
import '../widget/signUpTextButton.dart';
import '../../../core/constant/widget/customText.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  MyServices myServices = Get.find();
  LoginController loginController = Get.put(LoginController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<LoginController>(
        builder: (loginController){
      return Scaffold(
        body: Form(
          key: formKey,
          child: ListView(
            children: [
               CustomText(text: "Login".tr,style: context.textTheme.titleSmall,
                 padding: const EdgeInsets.only(top: 30,),),
               SizedBox(
                height: 200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Image.asset('image/on2.png',fit: BoxFit.fill),
                  )),
               CustomTextField(
                hintText: 'user name'.tr,
                prefixIcon:  const Icon(Icons.person_outline_outlined,),
                controller: loginController.userName,
                padding: const EdgeInsets.symmetric(horizontal:15,vertical: 10 ),
                validator: (s) {
                  return loginController.validLogin(loginController.valid);
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
                      loginController.showPassword();
                    },
                    child: Icon(
                        loginController.obscure ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                        color: Colors.grey.shade500),),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                obscureText: !loginController.obscure,
                enableSuggestions: loginController.obscure,
                onChanged: (s){
                  loginController.getUserName();
                  loginController.checkEP();
                },
                controller: loginController.password,
                validator: (s) {
                  return loginController.validLogin(loginController.valid);
                },

              ),
               const ForgetPassword(),
               LoginButton(
                  text: "Login".tr,
                  padding: const EdgeInsets.only(top: 50,left: 50,right: 50),
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
            ],
          ),
        ),
      );
    });

  }
}
