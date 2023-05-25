import 'package:flutter/material.dart';

class DexAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            tooltip: 'Open Area Module',
            icon: const Icon(Icons.map_outlined),
            onPressed: () {},
          ),
          IconButton(
            tooltip: 'Favorite',
            icon: const Icon(Icons.circle),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
