import 'package:flutter/material.dart';
import 'package:quiz_app/util/app_color.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final inputType;
  final inputAction;
  final controller;
  final maxLenght;

  AppTextField({
    required this.controller,
    required this.hintText,
    this.inputType,
    this.inputAction,
    this.maxLenght,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      textInputAction: inputAction,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.kBlue,
        //don't show limit
        counterText: "",
        labelText: hintText,
        labelStyle: const TextStyle(fontSize: 15, color: AppColor.kWhite),
        alignLabelWithHint: true,


        // hintText: hintText,
        contentPadding: const EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,

        ),
      ),
    );
  }
}
