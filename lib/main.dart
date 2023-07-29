import 'package:flutter/material.dart';
import 'package:universe7/pages/cartpage.dart';
import 'package:universe7/pages/homepage.dart';
import 'package:universe7/pages/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:universe7/utilities/routes.dart';
import 'package:universe7/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(const Universe7());
}

class Universe7 extends StatelessWidget {
  const Universe7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: MyTheme.lightTheme(context),
        debugShowCheckedModeBanner: false,
        initialRoute: Myrasta.HomeRoutes,
        routes: {
          "/": (context) =>
              const LoginPage(), // "/" ye yani first page jo ayega
          Myrasta.HomeRoutes: (context) => HomePage(),
          Myrasta.LoginRoutes: (context) => LoginPage(),
          Myrasta.cartRoute: (context) => CartPage(),
        });
  }
}
