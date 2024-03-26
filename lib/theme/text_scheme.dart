import 'package:flutter/material.dart';

TextStyle bodyDefault(TextTheme textTheme) =>
    textTheme.bodyMedium!.copyWith(fontSize: 12);
TextStyle bodyDefaultBold(TextTheme textTheme) =>
    bodyDefault(textTheme).copyWith(fontWeight: FontWeight.w600);

TextStyle bodyLarge(TextTheme textTheme) => textTheme.bodyMedium!.copyWith(
      fontSize: 16.5,
      fontWeight: FontWeight.w600,
    );
