import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../components/bottomNavBar.dart';
import '../components/homeButtom.dart';
import '../components/appBar.dart';
import '../utils/colors.dart';
import '../utils/loading.dart';
import '../utils/captalize.dart';

class DataService {
  final ValueNotifier<List> tableStateNotifier = ValueNotifier([]);
  final ValueNotifier<List<String>> propertyNamesNotifier = ValueNotifier([]);

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
  final ScrollController _scrollController = ScrollController();

  DexHomePage({super.key}) {
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMorePokemons();
    }
  }

  void _loadMorePokemons() {
    var limit = dataService.tableStateNotifier.value.length + 10;
    if (limit >= 1008) {
      limit = 1008;
    }
    dataService.loadPokemons(limit: limit);
  }

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
              objects: value, scrollEndedCallback: _loadMorePokemons);
        },
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DexButtomHome(),
      bottomNavigationBar: BottomDexAppBar(),
    );
  }
}

class MyCardWidget extends HookWidget {
  final List objects;
  final Function() scrollEndedCallback;

  const MyCardWidget(
      {super.key, required this.objects , required this.scrollEndedCallback});

  @override
  Widget build(BuildContext context) {
    var controller = useScrollController();
    useEffect(() {
      controller.addListener(() {
        if (controller.position.pixels == controller.position.maxScrollExtent) {
          scrollEndedCallback();
        }
      });
    }, [controller]);
    return ListView.separated(
        controller: controller,
        padding: const EdgeInsets.all(10),
        separatorBuilder: (_, __) => Divider(
              height: 5,
              thickness: 2,
              indent: 10,
              endIndent: 10,
              color: Theme.of(context).primaryColor,
            ),
        itemCount: objects.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == objects.length) {
            return const Center(
              child: LinearProgressIndicator(),
            );
          }
          final imageUrl = objects[index]['sprites']['front_default'];
          return Center(
            child: Card(
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    25), // Adjust the border radius as needed
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
                    title: Text(objects[index]['name'].toString().capitalize()),
                    subtitle: Text(objects[index]['id'].toString()),
                  )
                ],
              ),
            ),
          );
        });
  }
}
