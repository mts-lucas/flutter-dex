import 'package:flutter/material.dart';
import '../components/bottomNavBar.dart';
import '../components/homeButtom.dart';
import '../components/appBar.dart';

class DexDetailPage extends StatelessWidget {
  final jsonObject;
  DexDetailPage({this.jsonObject});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpAppBar(),
      body: const Center(
        child: Text(
          'Página Principal',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DexButtomHome(),
      bottomNavigationBar: BottomDexAppBar(),
    );
  }
}
