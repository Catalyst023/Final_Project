// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {Key? key,
      required this.controller,
      this.labelText = "",
      this.textFieldHeaderFlex = 0,
      this.textFieldFlex = 5,
      this.textFieldHeader = "",
      this.textFieldHeaderFontSize = 15.0,
      this.textFieldHeaderColor = Colors.white,
      required this.keyboardType,
      this.hideText = false,
      this.textFieldColor = Colors.white,
      this.focusedBorderColor = Colors.white,
      this.enabledBorderColor = Colors.grey,
      this.labelStyleColor = Colors.white})
      : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final int textFieldHeaderFlex;
  final String textFieldHeader;
  final double textFieldHeaderFontSize;
  final Color textFieldHeaderColor;
  final TextInputType keyboardType;
  final bool hideText;
  final Color? textFieldColor;
  final int textFieldFlex;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final Color? labelStyleColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20, right: 20),
      child: Row(
        children: [
          Expanded(
              flex: textFieldHeaderFlex,
              child: Text(textFieldHeader,
                  style: TextStyle(
                      fontSize: textFieldHeaderFontSize,
                      color: textFieldHeaderColor))),
          const SizedBox(width: 5.0),
          Expanded(
            flex: textFieldFlex,
            child: TextField(
              obscureText: hideText,
              style: TextStyle(color: textFieldColor),
              cursorColor: Colors.white,
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: labelStyleColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: focusedBorderColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: enabledBorderColor,
                  ),
                ),
                labelText: labelText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
