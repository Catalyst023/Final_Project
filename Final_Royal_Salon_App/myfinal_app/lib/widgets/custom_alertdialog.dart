import 'package:flutter/material.dart';
import 'package:myfinal_app/widgets/app_textfield.dart';

class CustomAlertdialog extends StatelessWidget {
  const CustomAlertdialog({
    Key? key,
    required this.firstController,
    required this.firstHeaderText,
    required this.secondController,
    required this.secondHeaderText,
    required this.thirdController,
    required this.thirdHeaderText,
    required this.actions,
  }) : super(key: key);

  final TextEditingController firstController;
  final TextEditingController secondController;
  final TextEditingController thirdController;
  final String firstHeaderText;
  final String secondHeaderText;
  final String thirdHeaderText;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titleTextStyle: const TextStyle(
        fontSize: 10.0,
      ),
      contentPadding: EdgeInsets.zero,
      content: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Edit your details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
          ),
          AppTextField(
            focusedBorderColor: Colors.purple,
            enabledBorderColor: Colors.blue,
            keyboardType: TextInputType.text,
            controller: firstController,
            textFieldHeaderColor: Colors.black,
            textFieldColor: Colors.black,
            textFieldHeader: firstHeaderText,
            textFieldHeaderFlex: 1,
            textFieldFlex: 4,
            // labelText: name,
          ),
          AppTextField(
            focusedBorderColor: Colors.purple,
            enabledBorderColor: Colors.blue,
            keyboardType: TextInputType.text,
            controller: secondController,
            textFieldHeaderColor: Colors.black,
            textFieldColor: Colors.black,
            textFieldHeader: secondHeaderText,
            textFieldHeaderFlex: 1,
            textFieldFlex: 4,
            //labelText: surname,
          ),
          AppTextField(
            focusedBorderColor: Colors.purple,
            enabledBorderColor: Colors.blue,
            keyboardType: TextInputType.phone,
            controller: thirdController,
            textFieldHeaderColor: Colors.black,
            textFieldColor: Colors.black,
            textFieldHeader: thirdHeaderText,
            textFieldFlex: 4,
            textFieldHeaderFlex: 1,
          ),
        ],
      ),
      actions: actions,
    );
  }
}
