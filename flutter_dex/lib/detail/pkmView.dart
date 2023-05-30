import 'package:flutter/material.dart';
import 'datailPokemon.dart';
import '../components/bottomNavBar.dart';
import '../components/homeButtom.dart';
import '../components/appBar.dart';

class DexDetailPage extends StatelessWidget {
  // final jsonObject;
  // DexDetailPage({this.jsonObject});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpAppBar(),
      body: Center(
        child: DetailPokemon(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DexButtomHome(),
      bottomNavigationBar: BottomDexAppBar(),
    );
  }
}
