import 'package:flutter/material.dart';
import 'package:triptrak/repo/firebase_repo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/travel.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: TextButton(
            onPressed: () async {
              await FirebaseRepo().signout();
            },
            
            child: Align(
  alignment: Alignment.topRight,
  child: Text(
    'Sign Out',
    style: TextStyle(
      color: Colors.red,
      fontSize: 18.0,
    ),
  ),
),

        ),
      ),
    ),
    
  );
}
}