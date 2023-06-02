import 'dart:html';

import 'package:flutter/material.dart';
import '../components/bottomNavBar.dart';
import '../components/homeButtom.dart';
import '../components/appBar.dart';
// import '../utils/search.dart';

// final DataSearch dataSearch = DataSearch();

class TelaQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final jsonObject = dataSearch.tableStateNotifier.value;
    // final imgUrl = jsonObject['result']['sprites']['other']['official-artwork']
    //     ['front_default'];
    return Scaffold(
      appBar: UpAppBar(),
      body: Center(
          child: Container(
        child: Stack(
          children: [
            Image.network(
              'assets/images/dexlogo.png',
              fit: BoxFit.cover,
              width: 200, // Ajuste o tamanho conforme necessário
              height: 200,
              // opacity: AlwaysStoppedAnimation(0.1),
              color: Colors.white,
            ),
            // Máscara preta
            Container(
              color: Colors.white.withOpacity(0), // Define a opacidade desejada
              width: 200, // Ajuste o tamanho conforme necessário
              height: 200,
            ),
          ],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DexButtomHome(),
      bottomNavigationBar: BottomDexAppBar(),
    );
  }
}
