import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.light,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        highlightColor: Color.fromARGB(255, 36, 33, 33),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.white)
            .copyWith(primary: Colors.deepPurple, secondary: darkBlue),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Color.fromARGB(145, 151, 175, 246),
        canvasColor: Color(0xFF191D29),
        highlightColor: Color.fromARGB(255, 170, 189, 246),
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Color.fromARGB(255, 109, 103, 146)),
          toolbarTextStyle: Theme.of(context)
              .textTheme
              .copyWith(
                titleLarge:
                    context.textTheme.titleLarge?.copyWith(color: Colors.white),
              )
              .bodyMedium,
          titleTextStyle: Theme.of(context)
              .textTheme
              .copyWith(
                titleLarge:
                    context.textTheme.titleLarge?.copyWith(color: Colors.white),
              )
              .titleLarge,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: darkBlue, brightness: Brightness.dark)
            .copyWith(secondary: Colors.black),
      );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBlue = Color(0xFF403b58);
  static Color darkCreamColor = Vx.gray900;
  static Color lightBluishColor = Color.fromARGB(255, 126, 21, 230);
}
