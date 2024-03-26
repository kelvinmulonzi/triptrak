import 'package:flutter/material.dart';

class CustomFilledBtn extends StatelessWidget {
  final String title;
  final double pad;
  final Function() onPressed;

  const CustomFilledBtn({
    super.key,
    required this.title,
    required this.onPressed,
    required this.pad,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.all(pad),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          minimumSize: const Size.fromHeight(50),
          textStyle: textTheme.labelMedium,
        ),
        child: Text(
          title,
        ),
      ),
    );
  }
}
