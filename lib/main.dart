import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universe7/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import 'models/themeprovider.dart';
import 'pages/cartpage.dart';
import 'pages/homepage.dart';
import 'pages/loginpage.dart';

import 'utilities/routes.dart';
import 'widgets/themes.dart';

void main() {
  runApp(VxState(store: MyStore(), child: Universe7()));
}

class Universe7 extends StatelessWidget {
  const Universe7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(), // Provide the ThemeProvider here.
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            themeMode:
                themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: MyTheme.lightTheme(context),
            darkTheme: MyTheme.darkTheme(context),
            debugShowCheckedModeBanner: false,
            initialRoute: Myrasta.HomeRoutes,
            routes: {
              "/": (context) =>
                  const LoginPage(), // "/" ye yani first page jo ayega
              Myrasta.HomeRoutes: (context) => HomePage(),
              Myrasta.LoginRoutes: (context) => LoginPage(),
              Myrasta.cartRoute: (context) => CartPage(),
            },
          );
        },
      ),
    );
  }
}
