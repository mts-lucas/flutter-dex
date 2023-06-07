import 'package:flutter/material.dart';
import 'package:flutter_dex/homepage/homePage.dart';
import 'package:flutter_dex/quiz/telaQuiz.dart';
import 'package:flutter_dex/search/telaSearch.dart';
import 'utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: AppColors.effectsBlue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => DexHomePage(),
        '/search': (context) => TelaSearch(),
        '/quiz': (context) => TelaQuiz(),
      },
    );
  }
}
