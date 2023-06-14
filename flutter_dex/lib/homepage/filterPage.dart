import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/bottomNavBar.dart';
import '../components/homeButtom.dart';
import '../components/appBar.dart';
import '../utils/loading.dart';
import './cardView.dart';

// Service responsible for loading Pokemon data
class DataService {
  final ValueNotifier typeStateNotifier =
      ValueNotifier({'result': null, 'lastType': ''});

  int limit = 10;

  Future<void> loadPokemonsByType({required String type}) async {
    var typeUri = Uri(
      scheme: 'https',
      host: 'pokeapi.co',
      path: 'api/v2/type/$type',
    );

    var jsonString = await http.read(typeUri);
    var typeJson = jsonDecode(jsonString);

    var pokemonList = typeJson['pokemon'];

    var pokemons = <dynamic>[];
    var n = 0;

    // Fetch Pokemon data based on the current limit value
    while (n < limit) {
      var pokemonUri = Uri.parse(pokemonList[n]['pokemon']['url']);
      var pokemonJsonString = await http.read(pokemonUri);
      var pokemonJson = jsonDecode(pokemonJsonString);
      pokemons.add(pokemonJson);
      n++;
    }

    // Update the state notifier with the fetched Pokemon data
    typeStateNotifier.value = {'result': pokemons, 'lastType': type};
  }

  // Increase the limit value by 8 (or any desired value)
  void increaseLimit() {
    limit += 8;
    if (limit >= 1008) {
      limit = 1008;
    }
  }
}

final dataService = DataService();

class DexTypePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  String type;

  DexTypePage({super.key, this.type = ''}) {
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // Checks if the user scrolled to the end of the page
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMorePokemons();
    }
  }

  void _loadMorePokemons() {
    dataService.increaseLimit(); // Increase the limit value
    dataService.loadPokemonsByType(type: type); // Load more Pokemons
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpAppBar(text: 'TYPE: ${type.toUpperCase()}'),
      body: Center(
          child: ValueListenableBuilder(
        // Load Pokemons of the given type
        valueListenable: dataService.typeStateNotifier,
        builder: (_, value, __) {
          dataService.loadPokemonsByType(type: type);
          // Chech if the data is already loaded or if the file is different from the last type requested
          if (value['result'] == null || value['lastType'] != type) {
            return BigLoading();
          }
          // Display the fetched Pokemon data in a card view
          return MyCardWidget(
              objects: value['result'], scrollEndedCallback: _loadMorePokemons);
        },
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DexButtomHome(),
      bottomNavigationBar: BottomDexAppBar(),
    );
  }
}
