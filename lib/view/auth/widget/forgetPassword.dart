import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/decoration/color.dart';
import '../Screen/forgetPassword.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: (){
            Get.to(Forget());
          }
          , child: Text("Do you Forget Password?   ".tr,
                     style: TextStyle(color: ColorC.grey),)),
    );
  }
}
