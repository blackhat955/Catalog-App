import 'package:flutter/material.dart';
import 'package:flutter_learning_1/Utility/routes.dart';
import 'package:flutter_learning_1/pages/home_page.dart';
import 'package:flutter_learning_1/pages/login.dart';
import 'package:flutter_learning_1/widget/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      // give you color according to your system

      theme: Mytheme.lightTheme(context),
      darkTheme: Mytheme.darkTheme(context),
      
      routes: {
        MyRoutes.loginRoutes: (context) => LoginPage(),
        "/": (context) => Home(),
        // MyRoutes.loginRoutes: (context) => LoginPage()
      },
    );
  }
}
