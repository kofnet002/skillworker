import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool
      isPass; // to check if the field is password, then hide the user input
  final String hintText;
  final TextInputType
      textInputType; // to determine the type of input, eg. password, datetime, etc
  final icon;

  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      this.isPass = false, // giving it a default value
      required this.hintText,
      required this.textInputType,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));

    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          suffixIcon: icon,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          // focusedBorder: inputBorder,
          // enabledBorder: inputBorder,
          // filled: true,
          // fillColor: Colors.transparent,
          contentPadding: const EdgeInsets.all(8)),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
