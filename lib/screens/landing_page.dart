import 'package:flutter/material.dart';
import 'package:triptrak/screens/login.dart';

import 'register.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore your destination"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/landingbg.png'),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Loginpage(),
                  ),
                );
              },
              child: const Text('Login'),
            ),
            const SizedBox(
              width: 20,
            ),
            FilledButton.tonal(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
              child: const Text('Register'),
            )
          ],
        ),
      ),
    );
  }
}
