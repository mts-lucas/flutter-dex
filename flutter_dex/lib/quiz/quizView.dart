import 'package:flutter/material.dart';
import 'package:flutter_dex/search/searchInput.dart';
import '../components/bottomNavBar.dart';
import '../components/homeButtom.dart';
import '../components/appBar.dart';



class TelaSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpAppBar(),
      body: SearchInput(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DexButtomHome(),
      bottomNavigationBar: BottomDexAppBar(),
    );
  }
}