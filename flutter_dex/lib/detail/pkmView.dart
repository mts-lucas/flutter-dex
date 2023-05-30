import 'package:flutter/material.dart';
import 'datailPokemon.dart';
import '../components/bottomNavBar.dart';
import '../components/homeButtom.dart';
import '../components/appBar.dart';
import 'package:flutter_dex/utils/loading.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataService {
  final ValueNotifier<List> tableStateNotifier = new ValueNotifier([]);
  final ValueNotifier<List<String>> propertyNamesNotifier =
      new ValueNotifier([]);

  DataService() {
    loadPokemons();
  }

  void load(index) {
    switch (index) {
      case 1:
        loadPokemons();
        break;
      case 2:
        break;
    }
  }

  Future<void> loadPokemons() async {
    var pokeUri = Uri(
      scheme: 'https',
      host: 'pokeapi.co',
      path: 'api/v2/pokemon/1',
    );

    var jsonString = await http.read(pokeUri);

    var pokeJson = jsonDecode(jsonString);

    tableStateNotifier.value = [pokeJson]; // Convert pokeJson to a List
  }
} // Convert pokeJson to a List

final dataService = DataService();

class DexDetailPage extends StatelessWidget {
  // final jsonObject;
  // DexDetailPage({this.jsonObject});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpAppBar(),
      body: Center(
          child: ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                if (value.isEmpty) {
                  return BigLoading();
                }
                return DetailPokemon(
                  jsonObject: value,
                );
              })),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DexButtomHome(),
      bottomNavigationBar: BottomDexAppBar(),
    );
  }
}
