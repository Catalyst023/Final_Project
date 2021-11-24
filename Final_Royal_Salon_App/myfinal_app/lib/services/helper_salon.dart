import 'package:backendless_sdk/backendless_sdk.dart';

import 'package:flutter/material.dart';
import 'package:myfinal_app/routes/routes.dart';

import 'package:myfinal_app/services/user_service.dart';
import 'package:myfinal_app/widgets/dialogs.dart';
import 'package:provider/provider.dart';

void createNewUserSalonInUI(BuildContext context,
    {required String email,
    required String password,
    required String name,
    required String salon_name,
    required String confirm,
    required String cellphone,
    required String salonLocation,
    required String surname}) async {
  FocusManager.instance.primaryFocus?.unfocus();

  if (email.isEmpty ||
      name.isEmpty ||
      surname.isEmpty ||
      cellphone.isEmpty ||
      salon_name.isEmpty ||
      password.isEmpty ||
      confirm.isEmpty ||
      salonLocation.isEmpty) {
    showSnackBar(
      context,
      'Please enter all fields!',
    );
  } else if (password.toString() != confirm.toString()) {
    showSnackBar(
      context,
      'Passwords do not match!',
    );
  } else {
    BackendlessUser user = BackendlessUser()
      ..email = email.trim()
      ..password = password.trim()
      ..putProperties({
        'name': name.trim(),
        'surname': surname.trim(),
        'salon_name': salon_name.toString().trim(),
        'salonLocation': salonLocation.toString().trim(),
        'cellphone': cellphone.toString().trim()
      });

    String result = await context.read<UserService>().createUser(user);
    if (result != 'OK') {
      showSnackBar(context, result);
    } else {
      showSnackBar(context, 'New user successfully created!');
      Navigator.pop(context);
    }
  }
}

void loginUserSalonInUI(BuildContext context,
    {required String email, required String password}) async {
  FocusManager.instance.primaryFocus?.unfocus();
  if (email.isEmpty || password.isEmpty) {
    showSnackBar(context, 'Please enter both fields!');
  } else {
    String result = await context
        .read<UserService>()
        .loginUser(email.trim(), password.trim());
    if (result != 'OK') {
      showSnackBar(context, result);
    } else {
      // context.read<TodoService>().getTodos(email);
      Navigator.of(context).popAndPushNamed(RouteManager.salonMainPage);
    }
  }
}

void logoutUserInUI(BuildContext context) async {
  String result = await context.read<UserService>().logoutUser();
  if (result == 'OK') {
    context.read<UserService>().setCurrentUserNull();
    Navigator.popAndPushNamed(context, RouteManager.loginPage);
  } else {
    showSnackBar(context, result);
  }
}
