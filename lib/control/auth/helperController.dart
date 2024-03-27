import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Helper extends GetxController{

 // String email_H = "";
 // String userName_H = "";
 // String password_H = "";
  bool validator = true;
  bool obscure = false;

  showPassword(){
    obscure = !obscure;
    update();
  }

}