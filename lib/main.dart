import 'package:flutter/material.dart';
import 'package:universe7/pages/homepage.dart';
import 'package:universe7/pages/loginpage.dart';

void main() {
  runApp(const Universe7());
}

class Universe7 extends StatelessWidget {
  const Universe7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        routes: {
          "/": (context) => LoginPage(), // "/" ye yani first page jo ayega

          "/home": (context) => HomePage(),
        });
  }
}
