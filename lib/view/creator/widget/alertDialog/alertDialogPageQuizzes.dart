import 'package:beta/view/creator/widget/TextField/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/widget/customText.dart';
import '../../../../core/constant/widget/customTextButton.dart';
import '../../../../core/decoration/color.dart';
import '../TextField/editNameTextField.dart';

class AlertDialogs {

  AlertDialogs({
    this.onPressedDelete,
    this.onPressedCancel,
    this.onPressedEdit,
    this.onChangedEdit,
    this.validator,
    this.formKey,
  });

  void Function()? onPressedDelete;
  void Function()? onPressedCancel;
  void Function()? onPressedEdit;
  void Function(String)? onChangedEdit;
  String? Function(String?)? validator;
   GlobalKey<FormState>? formKey = GlobalKey<FormState>();

  Future<dynamic> deleteQuiz(BuildContext context) {
    return Get.defaultDialog(
      titlePadding: EdgeInsets.zero,
      title: "",
      content: CustomText(
        text: "Are you sure you want to delete this quiz?".tr,
        style: context.textTheme.displaySmall,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),),
      actions: <Widget>[
        CustomTextButton(
          text: "Cancel".tr,
          fontSize: 22,
          color: ColorC.black,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          onPressed:onPressedCancel,
        ),
        CustomTextButton(
          text: "Delete".tr,
          fontSize: 22,
          color: ColorC.redDark,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          onPressed: onPressedDelete,

        )
      ],
    );
  }

  void editNameQuiz(AsyncSnapshot<dynamic> snapshot, int index,BuildContext context) {
    Get.defaultDialog(
      barrierDismissible: false,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      title: "Edit name quiz".tr,
      titlePadding: const EdgeInsets.symmetric(vertical: 15),
      content: SizedBox(
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: snapshot.data["data"][index]["name_quiz"],
              style: context.textTheme.labelMedium,
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),),
            Form(
              key: formKey,
              child: CustomTextField(
                hintText: 'quiz name'.tr,
                onChanged:onChangedEdit,
                prefixIcon: const Icon(Icons.drive_file_rename_outline),
                maxLength: 20,
                keyboardType: TextInputType.name,
                padding:  EdgeInsets.zero,
                validator: validator,
              ),
            ),
          ],
        ),
      ),
      actions: [
        CustomTextButton(
          text: "Cancel".tr,
          fontSize: 22,
          onPressed: onPressedCancel,
          color: ColorC.redDark,
          padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),),
        CustomTextButton(
          text: "Edit".tr,
          fontSize: 22,
          color: ColorC.greenDark,
          padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
          onPressed: onPressedEdit,
        ),
      ]
    );
  }
}

