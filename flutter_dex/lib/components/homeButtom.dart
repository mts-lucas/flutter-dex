import 'package:flutter/material.dart';
import '../utils/colors.dart';

class DexButtomHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.popUntil(context, ModalRoute.withName('principal'));
      },
      backgroundColor: AppColors.effectsBlue, // Define a cor de fundo do botão
      elevation: 4.0,
      tooltip: 'Return to Home', // Define a elevação do botão
      shape: CircleBorder(), // Define o formato do botão como circular
      child: Container(
        width: 72.0,
        height: 72.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.effectsBlue
                  .withOpacity(0.8), // Define a cor e opacidade da sombra
              offset: Offset(0,
                  2), // Define o deslocamento da sombra (horizontal, vertical)
              blurRadius: 4.0, // Define o desfoque da sombra
            ),
          ],
        ),
        child: const Center(
          child: Text(
            '',
          ),
        ),
      ),
    );
  }
}
