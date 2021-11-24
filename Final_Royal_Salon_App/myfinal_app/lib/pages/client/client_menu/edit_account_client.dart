import 'package:flutter/material.dart';
import 'package:myfinal_app/services/helper_user.dart';
import 'package:myfinal_app/services/user_service.dart';
import 'package:myfinal_app/widgets/card_template.dart';
import 'package:myfinal_app/widgets/custom_alertdialog.dart';

import 'package:provider/provider.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  late TextEditingController usernameController;
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController phonenumberController;
  late TextEditingController passwordController;
  late TextEditingController confirmController;
  late String email;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    nameController = TextEditingController();
    surnameController = TextEditingController();
    passwordController = TextEditingController();
    confirmController = TextEditingController();
    phonenumberController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    nameController.dispose();
    surnameController.dispose();
    phonenumberController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    email = context.read<UserService>().currentUser!.email;

    debugPrint(email);

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'Settings',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.normal,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            email,
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          CardTemplate(
              title: 'Security',
              subtitle: 'Change Password, Banking Details',
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CustomAlertdialog(
                        firstController: passwordController,
                        firstHeaderText: 'Password: ',
                        secondController: confirmController,
                        secondHeaderText: 'Confirm: ',
                        thirdController: phonenumberController,
                        thirdHeaderText: '',
                        actions: [
                          TextButton(
                            onPressed: () {
                              updateUserDatainUI(
                                  context,
                                  usernameController.text,
                                  passwordController.text,
                                  confirmController.text,
                                  nameController.text,
                                  surnameController.text,
                                  phonenumberController.text);

                              Navigator.pop(context);
                            },
                            child: const Text('DONE'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('CANCEL'),
                          ),
                        ],
                      );
                    });
              }),
          CardTemplate(
            title: 'Account Settings',
            subtitle: 'Name, Surname, Phone number',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return CustomAlertdialog(
                      firstController: nameController,
                      firstHeaderText: 'Name:',
                      secondController: surnameController,
                      secondHeaderText: 'Surname:',
                      thirdController: phonenumberController,
                      thirdHeaderText: 'Phone number:',
                      actions: [
                        TextButton(
                          onPressed: () {
                            updateUserDatainUI(
                                context,
                                usernameController.text,
                                passwordController.text,
                                confirmController.text,
                                nameController.text,
                                surnameController.text,
                                phonenumberController.text);

                            Navigator.pop(context);
                          },
                          child: const Text('DONE'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                            );
                          },
                          child: const Text('CANCEL'),
                        ),
                      ],
                    );
                  });
            },
          ),
          CardTemplate(
              title: 'Location',
              subtitle: 'Change location',
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CustomAlertdialog(
                        firstController: passwordController,
                        firstHeaderText: 'Street:',
                        secondController: confirmController,
                        secondHeaderText: 'Surburb:',
                        thirdController: phonenumberController,
                        thirdHeaderText: 'City',
                        actions: [
                          TextButton(
                            onPressed: () {
                              updateUserDatainUI(
                                  context,
                                  usernameController.text,
                                  passwordController.text,
                                  confirmController.text,
                                  nameController.text,
                                  surnameController.text,
                                  phonenumberController.text);

                              Navigator.pop(context);
                            },
                            child: const Text('DONE'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('CANCEL'),
                          ),
                        ],
                      );
                    });
              }),
          CardTemplate(
              title: 'Policy',
              subtitle: 'Terms and Conditions, License',
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        content: Text('No policy yet'),
                      );
                    });
              }),
        ],
      ),
    );
  }
}
