import 'package:app/provider/users.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/views/user_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/user_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (cxt) => Users(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppRoutes.HOME: (_) => const UserList(),
        AppRoutes.USER_FORM: (_) => UserForm()
      },
     ),
    );
  }
}
