import 'package:flutter/material.dart';
import 'datailPokemon.dart';
import '../components/bottomNavBar.dart';
import '../components/homeButtom.dart';
import '../components/appBar.dart';
import 'package:flutter_dex/utils/loading.dart';
import '../utils/captalize.dart';


class DexDetailPage extends StatelessWidget {
  final dynamic jsonObject;

  DexDetailPage({required this.jsonObject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpAppBar(text: jsonObject['name'].toString().capitalize()),
      body: Center(
        child: jsonObject != null
            ? DetailPokemon(jsonObject: jsonObject)
            : BigLoading(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DexButtomHome(),
      bottomNavigationBar: BottomDexAppBar(),
    );
  }
}
