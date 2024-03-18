import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/decoration/font.dart';
import '../../../core/decoration/color.dart';

class IndexContainer extends StatelessWidget {

   const IndexContainer({super.key,
     required this.index,
     required this.height,
     required this.width
   });

  final int index;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: context.theme.canvasColor,
            borderRadius: const BorderRadius.only(
                topRight:Radius.circular(5),
                bottomRight:Radius.circular(5))
        ),
        child: Center(child: Text((index+1).toString(),
          style:  TextStyle(fontSize: 30,color: ColorC.grey,fontFamily: Font.f1),))
    );
  }
}
