import 'package:flutter/material.dart';
import 'package:myfinal_app/models/todo.dart';
import 'package:myfinal_app/services/todo_service.dart';
import 'package:myfinal_app/services/user_service.dart';
import 'package:myfinal_app/widgets/dialogs.dart';
import 'package:provider/provider.dart';

void refreshTodosInUI(BuildContext context) async {
  String result = await context.read<TodoService>().getTodos(
        context.read<UserService>().currentUser!.email,
      );
  if (result != 'OK') {
    showSnackBar(context, result);
  } else {
    showSnackBar(context, 'Data successfully retrieved from the database.');
  }
}

void saveAllTodosInUI(BuildContext context) async {
  String result = await context
      .read<TodoService>()
      .saveTodoEntry(context.read<UserService>().currentUser!.email, true);
  if (result != 'OK') {
    showSnackBar(context, result);
  } else {
    showSnackBar(context, 'Data successfully saved online!');
  }
}

void createNewTodoInUI(BuildContext context,
    {required TextEditingController titleController,
    required TextEditingController title1Controller}) async {
  if (titleController.text.isEmpty || title1Controller.text.isEmpty) {
    showSnackBar(context, 'Please Enter all fields');
  } else {
    Todo todo = Todo(
      title: titleController.text.trim(),
      title1: title1Controller.text.trim(),
      created: DateTime.now(),
    );
    if (context.read<TodoService>().todos.contains(todo)) {
      showSnackBar(context, 'Duplicate value. Please try again.');
    } else {
      titleController.text = '';
      title1Controller.text = '';
      context.read<TodoService>().createTodo(todo);
      Navigator.pop(context);
    }
  }
}
