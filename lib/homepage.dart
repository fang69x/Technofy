import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String s = "universe";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      drawer: Drawer(),
      body: Center(
        child: Container(
          child: Text("Welcome to $s 7"),
        ),
      ),
    );
  }
}
