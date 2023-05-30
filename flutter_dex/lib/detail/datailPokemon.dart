import 'package:flutter/material.dart';

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
              PkmStats(),
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
    final dynamic order = jsonObject[0]['order'].toString().padLeft(4, '0');
    final dynamic name = jsonObject[0]['name'];
    return Text(
      '#${order} ${name}',
      style: TextStyle(
        color: Colors.white,
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
              color: Colors.blue,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                '${type['type']['name']}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
      ],
    );
  }
}


class PkmStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          child: const Text(
            'HP',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 200,
          height: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}
