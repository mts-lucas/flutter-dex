import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/captalize.dart';
import '../utils/dexfonts.dart';
import '../utils/colors.dart';
import '../utils/dexfonts.dart';

class SearchInput extends StatelessWidget {
  dynamic jsonObject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Theme(
          data: ThemeData(
            primaryColor: AppColors.text, // Cor das linhas externas e texto
            hintColor: AppColors.text, // Cor do texto de dica
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: AppColors.second, // Cor de fundo
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.text), // Cor das linhas externas
              ),
            ),
          ),
          child: Form(
            child: TextFormField(
              style: DexFont(fontSize: 16.0).normal(),
              decoration: InputDecoration(
                labelText: 'Search your Pokemon by name',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
