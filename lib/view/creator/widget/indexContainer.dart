import 'package:flutter/material.dart';
import '../../../core/constant/font.dart';
import '../../../core/decoration/Colors.dart';

class IndexContainer extends StatelessWidget {

   const IndexContainer({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
            color: ColorC.teal,
            borderRadius: const BorderRadius.only(
                topRight:Radius.circular(20),
                bottomRight:Radius.circular(20))
        ),
        child: Center(child: Text((index+1).toString(),
          style:  TextStyle(fontSize: 30,color: ColorC.white,fontFamily: Font.f1),))
    );
  }
}
