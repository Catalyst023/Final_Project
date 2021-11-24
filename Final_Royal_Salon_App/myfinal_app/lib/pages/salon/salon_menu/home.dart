import 'package:backendless_sdk/backendless_sdk.dart';

import 'package:flutter/material.dart';
import 'package:myfinal_app/services/helper_salon.dart';
import 'package:myfinal_app/services/helper_home.dart';
import 'package:myfinal_app/services/todo_service.dart';
import 'package:myfinal_app/services/user_service.dart';
import 'package:myfinal_app/widgets/app_progress_indicator.dart';
import 'package:myfinal_app/widgets/todo_card.dart';
import 'package:provider/provider.dart' as provider;
import 'package:tuple/tuple.dart';

class SalonHome extends StatefulWidget {
  const SalonHome({Key? key}) : super(key: key);

  @override
  _SalonHomeState createState() => _SalonHomeState();
}

class _SalonHomeState extends State<SalonHome> {
  late TextEditingController todoController;
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    todoController = TextEditingController();
    priceController = TextEditingController();
  }

  @override
  void dispose() {
    todoController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.blue],
          ),
        ),
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.refresh,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            refreshTodosInUI(context);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.save,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () async {
                            saveAllTodosInUI(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Services List',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 20),
                      child: provider.Consumer<TodoService>(
                        builder: (context, value, child) {
                          return ListView.builder(
                            itemCount: value.todos.length,
                            itemBuilder: (context, index) {
                              return TodoCard(
                                todo: value.todos[index],
                                todoToggleAction: (valueStatus) async {
                                  context
                                      .read<TodoService>()
                                      .toggleTodoDone(index);
                                },
                                deleteAction: () async {
                                  context
                                      .read<TodoService>()
                                      .deleteTodo(value.todos[index]);
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              title: Text('Create a new service'),
                              content: Container(
                                height: 150,
                                child: Column(
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                          hintText: 'Please enter style name'),
                                      controller: todoController,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          hintText: 'Please enter style price'),
                                      controller: priceController,
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                  child: Text('Save'),
                                  onPressed: () async {
                                    createNewTodoInUI(context,
                                        title1Controller: priceController,
                                        titleController: todoController);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text('Add more Services'),
                    ),
                  ),
                ],
              ),
            ),
            provider.Selector<UserService, Tuple2>(
              selector: (context, value) =>
                  Tuple2(value.showUserProgress, value.userProgressText),
              builder: (context, value, child) {
                return value.item1
                    ? AppProgressIndicator(text: value.item2)
                    : Container();
              },
            ),
            provider.Selector<TodoService, Tuple2>(
              selector: (context, value) =>
                  Tuple2(value.busyRetrieving, value.busySaving),
              builder: (context, value, child) {
                return value.item1
                    ? AppProgressIndicator(
                        text:
                            'Busy retrieving data from the database...please wait...')
                    : value.item2
                        ? AppProgressIndicator(
                            text:
                                'Busy saving data to the database...please wait...')
                        : Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
