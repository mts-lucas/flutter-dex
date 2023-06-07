import 'package:flutter/material.dart';

class ButtomSearch extends StatelessWidget {
  final Color colorButtom;
  final Color colorIcons;

  ButtomSearch({required this.colorButtom, required this.colorIcons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0), // Adiciona margem superior e inferior
      child: Container(
        height: 46.0,
        width: 100.0, // Ajuste a largura desejada
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(
              15.0), // Define o raio de curvatura das bordas
          color: colorButtom,
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.8), // Define a cor e opacidade da sombra
              offset: Offset(0,
                  2), // Define o deslocamento da sombra (horizontal, vertical)
              blurRadius: 4.0, // Define o desfoque da sombra
            ),
          ],
        ),
        child: IconButton(
          tooltip: 'Open Search Module',
          icon: const Icon(Icons.search),
          color: colorIcons,
          onPressed: () {
            Navigator.pushNamed(context, '/search');
          },
        ),
      ),
    );
  }
}
