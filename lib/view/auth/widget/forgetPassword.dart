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
            Get.offNamed("/forget");}
          , child: Row(
            children: [
              const SizedBox(width: 15,),
              Text("Do you forget password?".tr,
                         style: TextStyle(color: ColorC.grey),),
            ],
          )),
    );
  }
}
