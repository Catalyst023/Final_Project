import 'package:flutter/material.dart';
import 'package:myfinal_app/lifecycle.dart';
import 'package:myfinal_app/routes/routes.dart';
import 'package:myfinal_app/services/todo_service.dart';
import 'package:myfinal_app/services/user_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserService(),
        ),
        ChangeNotifierProvider(
          create: (context) => TodoService(),
        )
      ],
      child: const LifeCycle(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteManager.loadingPage,
          onGenerateRoute: RouteManager.generateRoute,
        ),
      ),
    );
  }
}
