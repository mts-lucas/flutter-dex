import 'package:flutter/material.dart';
import 'package:flutter_dex/homepage/homePage.dart';
import 'package:flutter_dex/quiz/telaQuiz.dart';
import 'package:flutter_dex/regions/telaRegion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dex basic',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'principal',
      routes: {
        'principal': (context) => DexHomePage(),
        'telaregions': (context) => TelaRegion(),
        'telaquiz': (context) => TelaQuiz(),
      },
    );
  }
}
