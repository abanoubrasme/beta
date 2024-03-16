import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/decoration/color.dart';

class Back extends StatelessWidget {

   Back({super.key,required this.page});

  String page ;

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: const Icon(Icons.arrow_back_ios_new),
      color: ColorC.grey,
      onPressed: () {
        Get.offAllNamed(page);
      },);
  }
}
