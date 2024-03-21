import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/decoration/font.dart';
import '../../../core/decoration/color.dart';

class RankBox extends StatelessWidget {

  int total ;
  String text ;
   RankBox({super.key,required this.total ,required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 60,
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: context.theme.canvasColor,

        ),
        child: Row(
          children: [
          const SizedBox(width: 10,),
          Text("$text :   $total",style: TextStyle(color: ColorC.white,fontSize: 22,),)
        ],),
      ),
    );
  }
}
