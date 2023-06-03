import 'dart:html';

import 'package:flutter/material.dart';
import '../components/bottomNavBar.dart';
import '../components/homeButtom.dart';
import '../components/appBar.dart';
import './quizView.dart';


class TelaQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: UpAppBar(),
      body: QuizContent(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DexButtomHome(),
      bottomNavigationBar: BottomDexAppBar(),
    );
  }
}
