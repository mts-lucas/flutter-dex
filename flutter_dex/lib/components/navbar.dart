import 'package:flutter/material.dart';
import '../utils/colors.dart';

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
            Container(
              height: 46.0,
              width: 100.0, // Ajuste a largura desejada
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(
                    15.0), // Define o raio de curvatura das bordas
                color: AppColors.background,
              ),
              child: IconButton(
                tooltip: 'Open Regions Module',
                icon: const Icon(Icons.map_outlined),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
            Container(
              height: 46.0,
              width: 100.0, // Ajuste a largura desejada
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(
                    15.0), // Define o raio de curvatura das bordas
                color: AppColors.background,
              ),
              child: IconButton(
                tooltip: 'Open Quiz Module',
                icon: const Icon(Icons.quiz_outlined),
                color: AppColors.text,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
