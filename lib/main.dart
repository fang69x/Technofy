import 'package:flutter/material.dart';
import 'package:universe7/pages/homepage.dart';
import 'package:universe7/pages/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:universe7/utilities/routes.dart';

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
          fontFamily: GoogleFonts.lato().fontFamily,
          // primaryTextTheme: GoogleFonts.latoTextTheme(),
        ),
        routes: {
          "/": (context) =>
              const LoginPage(), // "/" ye yani first page jo ayega
          Myrasta.HomeRoutes: (context) => HomePage(),
          Myrasta.LoginRoutes: (context) => LoginPage(),
        });
  }
}
