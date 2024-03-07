import 'package:flutter/material.dart';
import '../../../core/constant/font.dart';

class NameQuiz extends StatelessWidget {
  const NameQuiz({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding:  const EdgeInsets.only(left: 25,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name,
              style:  const TextStyle(fontSize: 25,fontFamily: Font.f1),),
            const SizedBox(height: 10,),
          ],
        ));
  }
}
