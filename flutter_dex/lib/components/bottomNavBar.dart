import 'package:flutter/material.dart';
import 'package:flutter_dex/components/buttomQuiz.dart';
import '../utils/colors.dart';
import 'buttomRegions.dart';
import 'buttomQuiz.dart';

class DexAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10.0)), // Define o raio de curvatura desejado
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: AppColors.bar,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ButtomRegions(
                colorButtom: AppColors.background, colorIcons: AppColors.text),
            ButtomQuiz(
                colorButtom: AppColors.background, colorIcons: AppColors.text),
          ],
        ),
      ),
    );
  }
}
