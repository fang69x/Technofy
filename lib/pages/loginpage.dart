import 'package:flutter/material.dart';
import 'package:universe7/pages/homepage.dart';
import 'package:universe7/utilities/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Image.asset(
            "assets/images/abstract-digital-grid-black-background.jpg",
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "Welcome",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                    labelText: " username",
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    labelText: " password",
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Myrasta.HomeRoutes);
                  },
                  child: Text("LOGIN"),
                ),
              ],
            ),
          )
        ],
      ),
      //   child: Center(
      //       child: Text(
      // "Login Page",
      // style: TextStyle(
      //   fontSize: 20,
      //   fontWeight: FontWeight.bold,
      //   color: Colors.red,
    );
  }
}
