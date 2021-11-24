import 'package:backendless_sdk/backendless_sdk.dart';

import 'package:flutter/material.dart';
import 'package:myfinal_app/routes/routes.dart';

import 'package:myfinal_app/services/user_service.dart';
import 'package:myfinal_app/widgets/dialogs.dart';
import 'package:provider/provider.dart';

void createNewUserInUI(BuildContext context,
    {required String email,
    required String password,
    required String name,
    required String confirm,
    required String cellphone,
    required String surname}) async {
  FocusManager.instance.primaryFocus?.unfocus();

  if (email.isEmpty ||
      name.isEmpty ||
      surname.isEmpty ||
      cellphone.isEmpty ||
      password.isEmpty ||
      confirm.isEmpty) {
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

void loginUserInUI(BuildContext context,
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
      Navigator.of(context).popAndPushNamed(RouteManager.clientMainPage);
    }
  }
}

void updateUserDatainUI(BuildContext context, String email, String password,
    String confirm, String name, String surname, String cellphone) async {
  FocusManager.instance.primaryFocus?.unfocus();
  String result;

  if (name.isEmpty &&
      surname.isEmpty &&
      cellphone.isEmpty &&
      password.isEmpty &&
      confirm.isEmpty) {
    showSnackBar(context, 'Nothing to change');
  }

  if (name.isNotEmpty) {
    result = await context
        .read<UserService>()
        .update('name', name.toString().trim());
    if (result != 'OK') {
      showSnackBar(context, result);
    } else {
      showSnackBar(context, 'User name successfully updated!');
      Navigator.pop(context);
    }
  }

  if (surname.isNotEmpty) {
    result = await context
        .read<UserService>()
        .update('surname', surname.toString().trim());
    if (result != 'OK') {
      showSnackBar(context, result);
    } else {
      showSnackBar(context, 'User surname successfully updated!');
      Navigator.pop(context);
    }
  }
  if (cellphone.isNotEmpty) {
    result = await context
        .read<UserService>()
        .update('cellphone', password.toString().trim());
    if (result != 'OK') {
      showSnackBar(context, result);
    } else {
      showSnackBar(context, 'User cellphone successfully updated!');
      Navigator.pop(context);
    }
  }
  if (password.isNotEmpty && confirm.isNotEmpty) {
    if (password.toString() == confirm.toString()) {
      result = await context
          .read<UserService>()
          .update('password', password.toString().trim());
      if (result != 'OK') {
        showSnackBar(context, result);
      } else {
        showSnackBar(context, 'User password successfully updated!');
        Navigator.pop(context);
      }
    } else {
      showSnackBar(context, 'Passwords do not match!');
    }
  }
}

void resetPasswordInUI(BuildContext context, {required String email}) async {
  if (email.isEmpty) {
    showSnackBar(context,
        'Please enter your email address then click on Reset Password again!');
  } else {
    String result =
        await context.read<UserService>().resetPassword(email.trim());
    if (result == 'OK') {
      showSnackBar(
          context, 'Successfully sent password reset. Please check your mail');
    } else {
      showSnackBar(context, result);
    }
  }
}

void logoutUserInUI1(BuildContext context) async {
  String result = await context.read<UserService>().logoutUser();
  if (result == 'OK') {
    context.read<UserService>().setCurrentUserNull();
    Navigator.popAndPushNamed(context, RouteManager.loginPage);
  } else {
    showSnackBar(context, result);
  }
}
