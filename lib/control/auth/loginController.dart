import 'package:beta/services/myServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/constant/link_api.dart';
import '../../model/RequestData.dart';
import 'helperController.dart';

class LoginController extends GetxController {

  RequestData requestData = RequestData();
  MyServices myServices = Get.find();

  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email    = TextEditingController();

  String emailH = "";
  String userNameH = "";
  String passwordH = "";

  bool valid = true;
  bool obscure = false;

  login()async{
    var response = await requestData.postRequest(linkLogin, {
      "user_name"    :userName.text,
      "password"     :password.text,
    });
    if(response["status"]=="success"){
      valid = false;
      update();
      Get.toNamed("/home",arguments: [getIdUser()]);
    }else{
      validLogin(valid);
    }
  }
  getIdUser()async{
    var response = await requestData.postRequest(linkGetIdUser, {
      "user_name"    :userName.text,
    });
    if(response["status"]=="success"){
      myServices.sharePref!.setString("id_user", response["data"][0]["id_user"].toString());

    }
  }
  getUserName()async{
    var response = await requestData.postRequest(linkGetUserName, {
      "user_name"    :userName.text,
    });
    if(response["status"]=="success"){
      emailH = response["data"][0]["email"];
      userNameH = response["data"][0]["user_name"];
      update();
    }else{
      validLogin(false);
    }
  }

  checkEP() async {
    var response = await requestData.postRequest(linkLogin, {
      "user_name"    :userName.text,
      "password" :password.text,
    });
    if(response["status"]=="success"){
     valid = false;
      update();
    }
  }

  validator (String val ,int max,int min ){
    if(emailH == val || userNameH == val){
      return "the User Name or Email is already exist";
    }
    if(val.isEmpty){
      return "not validator";
    }
    if(val.length>max){
      return "not validator";
    }
    if(val.length<min){
      return "not validator";
    }
  }
  validLogin (bool s){
    if(s){
      return "the user name or password are not correct ";
    }
  }

  showPassword(){
    obscure = !obscure;
    update();
  }


}