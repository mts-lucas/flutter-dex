import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/bottomNavBar.dart';
import '../components/homeButtom.dart';
import '../components/appBar.dart';
import '../utils/colors.dart';
import '../utils/loading.dart';

class DataService {
  final ValueNotifier<List> tableStateNotifier = new ValueNotifier([]);
  // final ValueNotifier<List<String>> columnNamesNotifier = new ValueNotifier([]);
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
        path: 'api/v2/pokemon/',
        queryParameters: {
          'limit': '20',
          'offset': '0',
        });

    var jsonString = await http.read(pokeUri);

    var pokeJson = jsonDecode(jsonString);

    var pokemonList = pokeJson['results'];

    var pokemons = <dynamic>[];

    for (var pokemon in pokemonList) {
      var pokemonUri = Uri.parse(pokemon['url']);
      var pokemonJsonString = await http.read(pokemonUri);
      var pokemonJson = jsonDecode(pokemonJsonString);
      pokemons.add(pokemonJson);
    }

    tableStateNotifier.value = pokemons; // Convert pokeJson to a List
  }
}

final dataService = DataService();

class DexHomePage extends StatelessWidget {
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
          return MyCardWidget(
            objects: value
          );
        },
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DexButtomHome(),
      bottomNavigationBar: BottomDexAppBar(),
    );
  }
}

class MyCardWidget extends StatelessWidget {
  List objects;

  MyCardWidget({this.objects = const []});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: objects.length,
        itemBuilder: (BuildContext context, int index) {
          final imageUrl = objects[index]['sprites']['front_default'];
          return Center(
            child: Card(
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10), // Adjust the border radius as needed
              ),
              color: AppColors.second,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      width: 100,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.contain,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    title: Text(objects[index]['name']),
                    subtitle: Text(objects[index]['order'].toString()),
                  )
                ],
              ),
            ),
          );
        });
  }
}

