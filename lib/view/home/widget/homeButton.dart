import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/decoration/color.dart';

class HomeButton extends StatelessWidget {
   HomeButton({super.key,
    required this.icon,
    required this.text,
    required this.onTap,
     required this.padding,
  });

  final IconData icon;
  final String text;
  final EdgeInsetsGeometry padding;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: onTap,
        child: Card(shadowColor: ColorC.grey2,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            height: 160,
            width: 150,
            child: Column(
              children: [
                Container(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Icon(icon,size: 60,),
                  ),
                Text(text, style: context.textTheme.headlineSmall),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeButton2 extends StatelessWidget {
   HomeButton2({super.key,
    required this.icon,
    required this.text,
    required this.onTap,
     required this.padding,
  });

  final IconData? icon;

  final String text;
  final EdgeInsetsGeometry padding;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 160,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: context.theme.primaryColorLight,
            // boxShadow:   [
            //   BoxShadow(
            //     color: context.theme.shadowColor,
            //     blurRadius: 7,
            //     spreadRadius: 2,
            //     offset: const Offset(0, 0),
            //   )
            // ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Icon(icon,size: 60,),
              ),
              Text(text, style: context.textTheme.headlineSmall),
            ],
          ),
        ),
      ),
    );
  }
}

