import 'package:flutter/material.dart';
import 'package:flutter_auth/utils/constant.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final inputType;
  final inputAction;
  final controller;
  final Color color;

  AppTextField({
    required this.controller,
    required this.hintText,
    this.inputType,
    this.inputAction,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context) - 20,
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        textInputAction: inputAction,
        maxLength: 25,
        decoration: InputDecoration(
          filled: true,
          fillColor: color,
          //don't show limit
          counterText: "",
          labelText: hintText,
          labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
          // hintText: hintText,
          contentPadding: const EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 0.2),),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 0.2),),
        ),
      ),
    );
  }
}
