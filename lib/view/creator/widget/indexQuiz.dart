import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/decoration/font.dart';
import '../../../core/decoration/color.dart';

class IndexQuiz extends StatelessWidget {

   const IndexQuiz({super.key,
     required this.index,
     required this.width,
     this.style,
   });

  final int index;
  final double width;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 5),
      child:  Container(
        width: 70,
        decoration: BoxDecoration(
            color: context.theme.canvasColor,
            borderRadius:  BorderRadius.circular(40)
        ),
        child: Center(child: Text((index+1).toString(),
            style: style ))
    ),);
  }
}
