import 'package:flutter/material.dart';



// NOTE Normal Text Form Field

class NormalTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String errorText;
  final Icon? prefixIcon;
  final bool isNumber;
  const NormalTextFormField({
    Key? key,
    required this.controller,
    required this.isNumber,
    required this.labelText,
    required this.hintText,
    required this.errorText,
    this.prefixIcon,
  }) : super(key: key);

  @override
  State<NormalTextFormField> createState() => _NormalTextFormFieldState();
}

class _NormalTextFormFieldState extends State<NormalTextFormField> {
  
  
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      keyboardType: widget.isNumber ? TextInputType.number : TextInputType.text,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        labelText: widget.labelText,
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.errorText;
        }
        return null;
      },
    );
  }
}
