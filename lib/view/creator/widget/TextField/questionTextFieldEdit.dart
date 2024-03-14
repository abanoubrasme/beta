import 'package:flutter/material.dart';

class QuestionTextFieldEdit extends StatelessWidget {

  QuestionTextFieldEdit({super.key,
    required this.controller,
    required this.onChanged,
  });

  void Function(String)? onChanged;
  final TextEditingController controller ;

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 260,
            width: Material.defaultSplashRadius,
            decoration: BoxDecoration(color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: const Offset(0, 2)),
                ]),
            margin: const EdgeInsets.all(10),
            child: Center(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.text,
                  scrollPadding: const EdgeInsets.all(10),
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.done,
                  onChanged: onChanged,
                  cursorColor: Colors.black12,
                  cursorHeight: 40,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  style: const TextStyle(fontSize: 25),
                  decoration: const InputDecoration(
                    hintText: "Add Question",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                )),
          );
  }
}
