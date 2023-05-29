import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'buttomRegions.dart';

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
            ButtomRegions(colorButtom: AppColors.background, colorIcons: AppColors.text),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0), // Adiciona margem superior e inferior
              child: Container(
                height: 46.0,
                width: 100.0, // Ajuste a largura desejada
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(
                      15.0), // Define o raio de curvatura das bordas
                  color: AppColors.background,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(
                          0.8), // Define a cor e opacidade da sombra
                      offset: Offset(0,
                          2), // Define o deslocamento da sombra (horizontal, vertical)
                      blurRadius: 4.0, // Define o desfoque da sombra
                    ),
                  ],
                ),
                child: IconButton(
                  tooltip: 'Open Quiz Module',
                  icon: const Icon(Icons.quiz_outlined),
                  color: AppColors.text,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
