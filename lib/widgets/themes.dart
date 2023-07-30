import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        buttonTheme: ButtonThemeData(
          buttonColor: darkBlue,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: Theme.of(context).textTheme.headline6,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.white)
            .copyWith(primary: Colors.deepPurple, secondary: darkBlue),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        buttonTheme: ButtonThemeData(
          buttonColor: lightBluishColor,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          toolbarTextStyle: Theme.of(context)
              .textTheme
              .copyWith(
                headline6:
                    context.textTheme.headline6?.copyWith(color: Colors.white),
              )
              .bodyText2,
          titleTextStyle: Theme.of(context)
              .textTheme
              .copyWith(
                headline6:
                    context.textTheme.headline6?.copyWith(color: Colors.white),
              )
              .headline6,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: darkBlue, brightness: Brightness.dark)
            .copyWith(secondary: Colors.white),
      );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBlue = Color.fromARGB(255, 34, 32, 46);
  static Color darkCreamColor = Vx.gray900;
  static Color lightBluishColor = Vx.indigo500;
}
