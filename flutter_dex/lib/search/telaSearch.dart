import 'package:flutter/material.dart';
import '../components/bottomNavBar.dart';
import '../components/homeButtom.dart';
import '../components/appBar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataSearch {
  final ValueNotifier<List> tableStateNotifier = ValueNotifier([]);

  Future<void> loadPokemon(String pkm) async {
    var pokeUri = Uri(
      scheme: 'https',
      host: 'pokeapi.co',
      path: 'api/v2/pokemon/${pkm}',
    );

    var jsonString = await http.read(pokeUri);

    var pokeJson = jsonDecode(jsonString);

    tableStateNotifier.value = pokeJson; // Convert pokeJson to a List
  }
}

final dataSearch = DataSearch();

class TelaSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpAppBar(),
      body: const Center(
        child: Text(
          'Página Regioes',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DexButtomHome(),
      bottomNavigationBar: BottomDexAppBar(),
    );
  }
}
