import 'package:flutter/material.dart';

class Mytheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        // themeMode work basis of theme
        primarySwatch: Colors.deepPurple,
        // here you can also give google font family,
        appBarTheme: AppBarTheme(
            elevation: 0.0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
            titleTextStyle: Theme.of(context).textTheme.headline6),
      );

  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);
}