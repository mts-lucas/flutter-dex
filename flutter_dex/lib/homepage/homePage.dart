import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/bottomNavBar.dart';
import '../components/homeButtom.dart';
import '../components/appBar.dart';
import '../utils/loading.dart';
import './cardView.dart';

class DataService {
  final ValueNotifier<List> tableStateNotifier = ValueNotifier([]);
  final ValueNotifier<List<String>> propertyNamesNotifier = ValueNotifier([]);

  DataService() {
    loadPokemons(); // Load initial Pokemon data
  }

  Future<void> loadPokemons({int limit = 10}) async {
    var pokeUri = Uri(
        scheme: 'https',
        host: 'pokeapi.co',
        path: 'api/v2/pokemon/',
        queryParameters: {
          'limit': limit.toString(),
          'offset': '0',
        });

    var jsonString = await http.read(pokeUri);

    var pokeJson = jsonDecode(jsonString);

    var pokemonList = pokeJson['results'];

    var pokemons = <dynamic>[];

    // Fetch data for each Pokemon
    for (var pokemon in pokemonList) {
      var pokemonUri = Uri.parse(pokemon['url']);
      var pokemonJsonString = await http.read(pokemonUri);
      var pokemonJson = jsonDecode(pokemonJsonString);
      pokemons.add(pokemonJson);
    }

    // Update the state notifier with the fetched Pokemon data
    tableStateNotifier.value = pokemons;
  }
}

final dataService = DataService();
// final app = UpAppBar(text: 'DEX HOME');

class DexHomePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final String type;

  DexHomePage({super.key, this.type = ''}) {
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
    var limit = dataService.tableStateNotifier.value.length + 8;
    if (limit >= 1008) {
      limit = 1008;
    }
    dataService.loadPokemons(limit: limit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpAppBar(text: 'DEX HOME'),
      body: Center(
          child: ValueListenableBuilder(
        valueListenable: dataService.tableStateNotifier,
        builder: (_, value, __) {
          // Chech if the data is already loaded
          if (value.isEmpty) {
            return BigLoading();
          }
          return MyCardWidget(
              objects: value, scrollEndedCallback: _loadMorePokemons);
        },
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DexButtomHome(),
      bottomNavigationBar: BottomDexAppBar(),
    );
  }
}
