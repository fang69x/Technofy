import 'package:flutter/material.dart';
import 'package:universe7/pages/homepage.dart';
import 'package:universe7/utilities/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool changebutton = false;

class _LoginPageState extends State<LoginPage> {
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
                InkWell(
                  onTap: () async {
                    setState(() {
                      changebutton = true;
                    });
                    await (Future.delayed(Duration(seconds: 1)));
                    Navigator.pushNamed(context, Myrasta.HomeRoutes);
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 50,
                    width: changebutton ? 50 : 100,
                    alignment: Alignment.center,
                    child: changebutton
                        ? Icon(
                            Icons.done,
                            color: Colors.white24,
                          )
                        : Text(
                            "login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(changebutton ? 20 : 8)),
                  ),
                )
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, Myrasta.HomeRoutes);
                //   },
                //   child: Text("LOGIN"),
                // ),
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
