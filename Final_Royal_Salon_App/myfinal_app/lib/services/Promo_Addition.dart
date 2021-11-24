// ignore: file_names
// ignore_for_file: file_names, non_constant_identifier_names, duplicate_ignore

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:myfinal_app/widgets/app_textfield.dart';
import 'package:myfinal_app/widgets/dialogs.dart';

class PromoAdd extends StatefulWidget {
  const PromoAdd({Key? key}) : super(key: key);

  @override
  _PromoAddState createState() => _PromoAddState();
}

class _PromoAddState extends State<PromoAdd> {
  late TextEditingController PromoStyle;
  late TextEditingController PromoDiscount;
  late TextEditingController PromoDuration;

  @override
  void initState() {
    super.initState();
    PromoStyle = TextEditingController();
    PromoDiscount = TextEditingController();
    PromoDuration = TextEditingController();
  }

  @override
  void dispose() {
    PromoStyle.dispose();
    PromoDiscount.dispose();
    PromoDuration.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[600],
        elevation: 10.0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 40.0),
                      child: Text(
                        'Add A New Promotion!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25),
                      ),
                    ),
                    AppTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: PromoStyle,
                      labelText: 'Please enter the style name',
                    ),
                    AppTextField(
                      hideText: false,
                      keyboardType: TextInputType.number,
                      controller: PromoDiscount,
                      labelText: 'Please enter promo Discount percentage %',
                    ),
                    AppTextField(
                        controller: PromoDuration,
                        labelText: 'Please enter the last day of the Promo',
                        keyboardType: TextInputType.datetime),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          size: 100,
                        )),
                    const SizedBox(
                      height: 55,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (PromoStyle.text.isEmpty ||
                            PromoDiscount.text.isEmpty ||
                            PromoDuration.text.isEmpty) {
                          showSnackBar(context, 'Please Enter all fields');
                        } else {
                          showSnackBar(context, 'Saved!');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                      ),
                      // ignore: prefer_const_constructors
                      child: Text('Add Promo'),
                    ),
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
