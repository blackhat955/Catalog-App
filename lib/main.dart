import 'package:flutter/material.dart';
import 'package:flutter_learning_1/Utility/routes.dart';
import 'package:flutter_learning_1/pages/home_page.dart';
import 'package:flutter_learning_1/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      // give you color according to your system
      theme: ThemeData(
          // themeMode work basis of theme
          primarySwatch: Colors.red
          // here you can also give fontfamily
          ),
      darkTheme: ThemeData(primarySwatch: Colors.deepPurple),
      routes: {
        MyRoutes.loginRoutes: (context) => LoginPage(),
        "/": (context) => Home(),
        // MyRoutes.loginRoutes: (context) => LoginPage()
      },
    );
  }
}
