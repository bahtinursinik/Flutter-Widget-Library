import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.controller,
      this.labelText,
      this.hintText,
      this.inputFormatter,
      this.keyboardType,
      Key? key})
      : super(key: key);

  String? labelText;
  String? hintText;
  List<TextInputFormatter>? inputFormatter;
  TextEditingController? controller;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatter,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 6, color: Colors.black)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        hintStyle: const TextStyle(fontSize: 12),
      ),
    );
  }
}
