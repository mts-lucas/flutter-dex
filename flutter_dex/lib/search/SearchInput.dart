import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/captalize.dart';
import '../utils/dexfonts.dart';
import '../utils/colors.dart';
import '../utils/dexfonts.dart';

class SearchInput extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset('assets/images/dexlogo.png', scale: 1.3,), // Imagem centralizada
            SizedBox(
                height:
                    60), // Espaçamento entre a imagem e o restante do conteúdo
            Theme(
              data: ThemeData(
                primaryColor: AppColors.text,
                hintColor: AppColors.text,
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: AppColors.second,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.text),
                  ),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _textEditingController,
                        style: DexFont(fontSize: 16.0).normal(),
                        decoration: InputDecoration(
                          labelText: 'Search your Pokemon by name',
                        ),
                      ),
                    ),
                    SizedBox(
                        width:
                            10), // Espaçamento entre a barra de pesquisa e o botão
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: ElevatedButton(
                        onPressed: () {
                          String searchQuery = _textEditingController.text;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Processing Data: $searchQuery')),
                          );
                        },
                        child: Icon(Icons.search),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          minimumSize: Size(60, 60),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
