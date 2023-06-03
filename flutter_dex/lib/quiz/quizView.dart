import 'package:flutter/material.dart';
import 'package:flutter_dex/search/searchInput.dart';
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
              child: Stack(
                children: [
                  Image.network(
                    myPokemon['result']['sprites']['other']['official-artwork']
                        ['front_default'],
                    fit: BoxFit.cover,
                    width: 200, // Ajuste o tamanho conforme necessário
                    height: 200,
                    // opacity: AlwaysStoppedAnimation(0.1),
                    color: Colors.white,
                  ),
                  // Máscara preta
                  Form(
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
                              String searchQuery = _textEditingController.text;
                              if (myPokemon['result']['name'] == searchQuery) {
                                print('acertou mizeravi');
                              } else {
                                final snackBar = SnackBar(
                                  content: Text(
                                      '${searchQuery} is Not correct Pokemon'),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
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
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
