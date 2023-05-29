import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'colors.dart';

class BigLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: AppColors.effectsBlue,
      size: 200.0,
    );
  }
}

class LittleLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: AppColors.effectsGreen,
      size: 15.0,
    );
  }
}
