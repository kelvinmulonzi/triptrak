// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../repo/firebase_repo.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.lightBlueAccent,
              Colors.lightBlue[200]!,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Register New Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                  labelText: 'email',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: passwordcontroller,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                ),
                obscureText: true, // to hide password
              ),
              const SizedBox(height: 10),
              const Padding(
                padding:
                    EdgeInsetsDirectional.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "forgot password",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  // check of password or email is empty
                  if (emailcontroller.text == "" ||
                      passwordcontroller.text == "") {
                    // handle empty fields
                  } else {
                    final String email = emailcontroller.text;
                    final String password = passwordcontroller.text;

                    try {
                      if (password.length < 8) {
                        throw Exception(
                            'Password must be at least 8 characters long');
                      }

                      await FirebaseRepo()
                          .createuser(email, password)
                          .then((value) async {

                        await FirebaseRepo().signout().then((value) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Loginpage(),
                            ),
                            (route) => route.isFirst,
                          );
                        });
                      });
                    } catch (e) {
                      // Show a dialog or snackbar to inform the user
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.lightBlue[400]!,
                ),
                child: const Text('sign up'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'or continue with',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
