import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Technofy/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import 'models/themeprovider.dart';
import 'pages/cartpage.dart';
import 'pages/homepage.dart';
import 'pages/loginpage.dart';
import 'utilities/routes.dart';
import 'widgets/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(VxState(store: MyStore(), child: const Technofy()));
}

class Technofy extends StatelessWidget {
  const Technofy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(), // Provide the ThemeProvider here.
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            theme: MyTheme.lightTheme(context),
            darkTheme: MyTheme.darkTheme(context),
            debugShowCheckedModeBanner: false,
            initialRoute: Myrasta.LoginRoutes,
            routes: {
              "/": (context) =>
                   LoginPage(onTap: () {  },), // "/" ye yani first page jo ayega
              Myrasta.HomeRoutes: (context) => HomePage(),
              Myrasta.LoginRoutes: (context) => LoginPage(onTap: () {  },),
              Myrasta.cartRoute: (context) => CartPage(),
            },
          );
        },
      ),
    );
  }
}
