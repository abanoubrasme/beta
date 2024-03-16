import 'package:beta/core/decoration/color.dart';
import 'package:flutter/material.dart';

class SlideBackground extends StatelessWidget {
  Color color ;
  String text ;
  IconData icon ;
  double fontSize ;
  AlignmentGeometry alignment;
  EdgeInsetsGeometry padding ;

   SlideBackground({super.key,
     required this.color,
     required this.text,
     required this.icon,
     required this.fontSize,
     required this.alignment
     ,required this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child:  Padding(
        padding: padding,
        child: Align(
          alignment:alignment,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
               Icon(
                icon ,
                color: Colors.white,
                size: 23,
              ),
              const SizedBox(height: 4,),
              Text( text,
                style:  TextStyle(
                    color: ColorC.white,
                    fontWeight: FontWeight.w700,
                    fontSize: fontSize),
                textAlign: TextAlign.left,
              ),
            //  const SizedBox(height: 5,),
            ],
          ),
        ),
      ),
    );
  }
}
