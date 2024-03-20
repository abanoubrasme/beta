import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/decoration/font.dart';

class HasData extends StatelessWidget {
  const HasData({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
              height: 150,
              width: 150,
              child: Image(image: AssetImage('image/notebook.png'))),
          const SizedBox(height: 18,),
          Text("you have no data".tr,
            style: context.textTheme.displaySmall),
          const SizedBox(height: 150,),
        ],
      ),
    );
  }
}
