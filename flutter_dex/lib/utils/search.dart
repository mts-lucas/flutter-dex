import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataSearch {
  final ValueNotifier<List> tableStateNotifier = ValueNotifier([]);
  Future<void> loadPokemon(var pkm) async {
    var pokeUri = Uri(
      scheme: 'https',
      host: 'pokeapi.co',
      path: 'api/v2/pokemon/${pkm}',
    );

    var jsonString = await http.read(pokeUri);

    var pokeJson = jsonDecode(jsonString);

    tableStateNotifier.value = [pokeJson];
  }
}
