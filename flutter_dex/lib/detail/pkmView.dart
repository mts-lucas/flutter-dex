import 'package:flutter/material.dart';
import 'datailPokemon.dart';
import '../components/bottomNavBar.dart';
import '../components/homeButtom.dart';
import '../components/appBar.dart';
import 'package:flutter_dex/utils/loading.dart';

class DexDetailPage extends StatelessWidget {
  final dynamic jsonObject;
  int indice;

  DexDetailPage({required this.jsonObject, required this.indice});

  @override
  Widget build(BuildContext context) {
    List<dynamic> jsonList = jsonObject is List<dynamic> ? jsonObject : [];


    return Scaffold(
      appBar: UpAppBar(),
      body: Center(
        child: jsonList.isNotEmpty
            ? DetailPokemon(
                jsonObject: jsonList[indice],
              )
            : BigLoading(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DexButtomHome(),
      bottomNavigationBar: BottomDexAppBar(),
    );
  }
}
