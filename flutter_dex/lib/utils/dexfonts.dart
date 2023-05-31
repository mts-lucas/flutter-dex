import 'package:flutter/material.dart';
import 'colors.dart';

class DexFont {
  final double fontSize;

  DexFont({required this.fontSize});

  TextStyle bolder() {
    return TextStyle(
      color: AppColors.text,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    );
  }

  TextStyle normal() {
    return TextStyle(
      color: AppColors.text,
      fontSize: fontSize,
      fontFamily: 'Roboto',
    );
  }
}
