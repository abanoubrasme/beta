import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/decoration/font.dart';
import '../../../core/decoration/color.dart';

class HomeButton extends StatelessWidget {
   HomeButton({super.key,
    required this.icon,
    required this.width,
    required this.height,
    required this.text,
    required this.onTap,
     required this.padding,
  });

  final Widget icon;
  final double width;
  final double height;
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
          width: 150,
          decoration:   BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow:   [
              BoxShadow(
                color: context.theme.shadowColor,
                  blurRadius: 7,
                  spreadRadius: 2,
                  offset: const Offset(0, 0),
              )
            ],
            color: context.theme.scaffoldBackgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                    height: height,
                    width: width,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: icon,
                ),
              Text(text, style: context.textTheme.displayMedium),
            ],
          ),
        ),
      ),
    );
  }
}

