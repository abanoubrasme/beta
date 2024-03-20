import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NameQuiz extends StatelessWidget {

     NameQuiz({super.key,
     required this.name,
     required this.titleSize,
  });
  final String name;
    double titleSize;

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding:  const EdgeInsets.only(left: 25,right: 20),
        child: Text( name,
          style:context.textTheme.labelMedium

        ));
  }
}
