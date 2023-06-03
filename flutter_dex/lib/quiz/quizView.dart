import 'package:flutter/material.dart';
import 'package:flutter_dex/search/searchInput.dart';
import 'package:flutter_dex/utils/colors.dart';
import 'package:flutter_dex/utils/loading.dart';
import 'package:flutter_dex/utils/search.dart';
import '../components/bottomNavBar.dart';
import '../components/homeButtom.dart';
import '../components/appBar.dart';
import '../utils/dexfonts.dart';
import 'dart:math';

DataSearch dataSearch = DataSearch();

class QuizContent extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  Random randomize = new Random();
  dynamic myPokemon;

  @override
  void dispose() {
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dataSearch.loadPokemon(randomize.nextInt(1009));
    return ValueListenableBuilder(
      valueListenable: dataSearch.tableStateNotifier,
      builder: (_, value, __) {
        myPokemon = value;
        if (myPokemon['status'] != 'ready') {
          return BigLoading();
        } else {
          return Center(
            child: Container(
              child: Column(
                children: [
                  Image.network(
                    myPokemon['result']['sprites']['other']['official-artwork']
                        ['front_default'],
                    fit: BoxFit.cover,
                    width: 200, // Ajuste o tamanho conforme necessário
                    height: 200,
                    color: AppColors.text,
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                                labelText: 'Try to get the right name',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: ElevatedButton(
                              onPressed: () async {
                                String searchQuery =
                                    _textEditingController.text;
                                if (myPokemon['result']['name'] ==
                                    searchQuery) {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        'Congratulations you were right! ${searchQuery} is the correct Pokemon!'),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: AppColors.rightMessage,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  dataSearch
                                      .loadPokemon(randomize.nextInt(1009));
                                } else {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        '${searchQuery} is Not correct Pokemon!'),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: AppColors.wrongMessage,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: Icon(Icons.play_circle_outline_sharp),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(15),
                                  minimumSize: Size(60, 60),
                                  backgroundColor: AppColors.effectsBlue),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: ElevatedButton(
                              onPressed: () async {
                                final snackBar = SnackBar(
                                  content: Text('loading a new pokemon!'),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: AppColors.normalMessage,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                dataSearch.loadPokemon(randomize.nextInt(1009));
                              },
                              child: Icon(Icons.restart_alt_rounded),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(15),
                                  minimumSize: Size(60, 60),
                                  backgroundColor: AppColors.effectsGreen),
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
      },
    );
  }
}
