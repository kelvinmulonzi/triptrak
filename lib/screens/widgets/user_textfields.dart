import 'package:flutter/material.dart';

class UserTextField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  const UserTextField({super.key, required this.controller,required this.title});

  @override
  State<UserTextField> createState() => _UserTextFieldState();
}

class _UserTextFieldState extends State<UserTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText:widget.title == 'password' ? 'Password': 'Email',
        border: OutlineInputBorder(),
        fillColor: Colors.white,
      ),
      obscureText:widget.title == 'password' ? true:false, // to hide password
    );
  }
}

