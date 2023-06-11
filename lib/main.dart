import 'package:flutter/material.dart';
import 'package:universe7/homepage.dart';

void main() {
  runApp(const Universe7());
}

class Universe7 extends StatelessWidget {
  const Universe7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
