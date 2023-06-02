import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataSearch {
  // final ValueNotifier<List> tableStateNotifier = ValueNotifier([]);
  final ValueNotifier tableStateNotifier =
      ValueNotifier({'status': "none", 'result': null});
  Future<void> loadPokemon(var pkm) async {
    var pokeUri = Uri(
      scheme: 'https',
      host: 'pokeapi.co',
      path: 'api/v2/pokemon/${pkm}',
    );

    try {
      tableStateNotifier.value = {'status': "loading", 'result': null};
      var jsonString = await http.read(pokeUri);
      var pokeJson = jsonDecode(jsonString);

      tableStateNotifier.value = {
        'status': pokeJson != [] ? "ready" : "notFound",
        'result': pokeJson
      };
    } catch (e) {
      tableStateNotifier.value = {'status': "error", 'result': null};
    }
  }
}
