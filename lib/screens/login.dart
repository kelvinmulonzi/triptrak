import 'package:flutter/material.dart';
import '../repo/firebase_repo.dart';
import 'widgets/user_textfields.dart'; // Import the next page widget
import 'package:google_fonts/google_fonts.dart'; // Import the Google Fonts package

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController emailcontroller =
      TextEditingController();
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
                'Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16.0),
              UserTextField(
                controller: emailcontroller,
                title: 'email',
              ),
              const SizedBox(height: 20),
              UserTextField(
                controller: passwordcontroller,
                title: 'password',
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsetsDirectional.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Forgot Password? ',
                        style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Reset',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
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
                  } else {
                    final String email = emailcontroller.text;
                    final String password = passwordcontroller.text;

                    await FirebaseRepo()
                        .loginuser(email, password)
                        .then((value) {});
                  }
                  // Navigate to the next page
                },
                child: const Text('Login'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue[400]!,
                  onPrimary: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
