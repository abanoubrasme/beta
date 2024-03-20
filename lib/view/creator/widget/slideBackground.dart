import 'package:beta/core/decoration/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlideBackground extends StatelessWidget {

  Color color ;
  String text ;
  IconData icon ;
  AlignmentGeometry alignment;
  EdgeInsetsGeometry padding ;

   SlideBackground({super.key,
     required this.color,
     required this.text,
     required this.icon,
     required this.alignment
     ,required this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: color,
      child:  Align(
        alignment:alignment,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Icon( icon ,
              color: ColorC.white,
              size: 25,
            ),
            Text( text, style:TextStyle(color: ColorC.white , fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
