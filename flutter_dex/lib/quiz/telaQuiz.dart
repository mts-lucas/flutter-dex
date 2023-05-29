import 'package:flutter/material.dart';
import '../components/bottomNavBar.dart';
import '../components/homeButtom.dart';

class TelaQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dex basics'),
      ),
      body: const Center(
        child: Text(
          'Página quiz',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DexButtomHome(),
      bottomNavigationBar: DexAppBar(),
    );
  }
}