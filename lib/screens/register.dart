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
                decoration: InputDecoration(
                  labelText: 'email',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                ),
                obscureText: true, // to hide password
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsetsDirectional.symmetric(horizontal: 25.0),
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
                        final user = value!.user!;

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
                      print(e);
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
                child: const Text('sign up'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.lightBlue[400]!,
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
