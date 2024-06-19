import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../button.dart';
import 'register_page.dart'; // Replace with actual path to your RegisterPage widget
import 'homepage.dart'; // Replace with actual path to your HomePage widget
import '../utilities/routes.dart';
import '../textForm.dart'; // Adjust imports based on your project structure
import '../tile.dart'; // Adjust imports based on your project structure

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isSigningIn = false;

  void signUserIn() async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context); // Pop the loading indicator

      // Navigate to home page
      Navigator.pushReplacementNamed(context, Myrasta.HomeRoutes);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context); // Pop the loading indicator

      // Handle error cases
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      } else {
        generalErrorMessage(e.message);
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Email'),
          content: Text('No user found with that email address.'),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Password'),
          content: Text('The password you entered is incorrect.'),
        );
      },
    );
  }

  void generalErrorMessage(String? message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message ?? 'An unknown error occurred.'),
        );
      },
    );
  }

  void showNotification() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Registration Successful! Please log in'),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    setState(() {
      _isSigningIn = true;
    });

    try {
      final FirebaseAuth auth = FirebaseAuth.instance;

      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
        await auth.signInWithCredential(credential);

        final User? user = userCredential.user;

        if (user != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(
            content: 'Google Sign-In was cancelled.',
          ),
        );
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          content: 'Error occurred using Google Sign-In. Try again.',
        ),
      );
    } finally {
      setState(() {
        _isSigningIn = false;
      });
    }
  }

  SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 209, 209),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 25),
                const Icon(
                  Icons.lock,
                  color: Color.fromARGB(255, 126, 126, 126),
                  size: 100,
                ),
                const SizedBox(height: 25),
                const Text(
                  'Welcome back, you have been missed',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: emailController,
                  hintText: "Username",
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(color: Color.fromARGB(255, 88, 88, 88)),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25.0),
                MyButton(
                  text: "Sign in",
                  onTap: signUserIn,
                ),
                const SizedBox(height: 25.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 146, 143, 143),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 146, 143, 143),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                SignInTile(
                  imagePath: 'lib/images/google.png',
                  onTap: signInWithGoogle,
                ),

                const SizedBox(height: 20),
                const SignInTile(imagePath: 'lib/images/apple.png',),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(
                              onTap: () {},
                            ),
                          ),
                        );
                        if (result == true) {
                          showNotification();
                        }
                      },
                      child: const Text(
                        "Register now",
                        style: TextStyle(
                          color: Color.fromARGB(255, 48, 48, 48),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
