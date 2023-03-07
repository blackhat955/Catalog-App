import 'package:flutter/material.dart';
import 'package:flutter_learning_1/widget/drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Chat App'),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to the coding hell"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
