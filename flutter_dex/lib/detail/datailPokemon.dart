import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/captalize.dart';

class DetailPokemon extends StatelessWidget {
  List<dynamic> jsonObject;
  DetailPokemon({required this.jsonObject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PkmImg(
                jsonObject: jsonObject,
              ),
              PkmNameIndex(
                jsonObject: jsonObject,
              ),
              PkmTypes(
                jsonObject: jsonObject,
              ),
              SizedBox(
                height: 10,
              ),
              PkmStats(
                jsonObject: jsonObject,
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PkmImg extends StatelessWidget {
  List<dynamic> jsonObject;
  PkmImg({required this.jsonObject});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        jsonObject[0]['sprites']['other']['official-artwork']['front_default'];

    return Image.network(imageUrl);
  }
}

class PkmNameIndex extends StatelessWidget {
  dynamic jsonObject;
  PkmNameIndex({required this.jsonObject});

  @override
  Widget build(BuildContext context) {
    final dynamic id = jsonObject[0]['id'].toString().padLeft(4, '0');
    final dynamic name = jsonObject[0]['name'].toString().capitalize();
    return Text(
      '#${id} ${name}',
      style: TextStyle(
        color: AppColors.text,
        fontSize: 30,
      ),
    );
  }
}

class PkmTypes extends StatelessWidget {
  dynamic jsonObject;

  PkmTypes({required this.jsonObject});

  @override
  Widget build(BuildContext context) {
    final tipos = jsonObject[0]['types'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var type in tipos)
          Container(
            width: 100,
            height: 40,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color:
                  TypesColors().pkmColorType(type['type']['name'].toString()),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                '${type['type']['name']}',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class PkmStats extends StatelessWidget {
  dynamic jsonObject;

  PkmStats({required this.jsonObject});

  @override
  Widget build(BuildContext context) {
    final status = jsonObject[0]['stats'];
    return Column(children: [
      for (var stat in status)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160,
              child: Text(
                '${stat['stat']['name']}: ${stat['base_stat']}',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              width: 150,
              height: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: (stat['base_stat'] / 200),
                  backgroundColor: AppColors.text,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.effectsGreen),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      // const SizedBox(height: 20),
    ]);
  }
}
