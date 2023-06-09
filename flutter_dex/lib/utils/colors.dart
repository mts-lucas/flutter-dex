import 'package:flutter/material.dart';

class TypesColors {
  static final fire = Colors.orange;
  static final water = Colors.blue;
  static final grass = Colors.green;
  static final electric = Colors.yellow;
  static final fairy = Colors.pinkAccent.shade100;
  static final fighting = Colors.deepOrange.shade700;
  static final dark = Colors.blueGrey.shade800;
  static final bug = Colors.lime;
  static final ghost = Colors.deepPurple.shade900;
  static final poison = Colors.purple;
  static final flying = Colors.indigo.shade300;
  static final normal = Colors.grey.shade600;
  static final steel = Color.fromARGB(255, 130, 175, 189);
  static final ice = Colors.blue.shade200;
  static final dragon = Colors.red.shade700;
  static final psychic = Colors.pinkAccent;
  static final ground = Color.fromARGB(218, 236, 180, 12);
  static final rock = Colors.brown.shade800;

  Color pkmColorType(pkmData) {
    switch (pkmData) {
      case 'fire':
        return fire;
      case 'water':
        return water;
      case 'grass':
        return grass;
      case 'electric':
        return electric;
      case 'fairy':
        return fairy;
      case 'fighting':
        return fighting;
      case 'dark':
        return dark;
      case 'bug':
        return bug;
      case 'ghost':
        return ghost;
      case 'poison':
        return poison;
      case 'flying':
        return flying;
      case 'normal':
        return normal;
      case 'steel':
        return steel;
      case 'ice':
        return ice;
      case 'dragon':
        return dragon;
      case 'psychic':
        return psychic;
      case 'ground':
        return ground;
      case 'rock':
        return rock;
      default:
        return Colors.black;
    }
  }
}

class AppColors {
  static final background = Colors.grey.shade900;
  static final second = Colors.grey.shade700;
  static final bar = Colors.red;
  static final text = Colors.grey.shade200;
  static final effectsBlue = Colors.lightBlue;
  static final effectsGreen = Colors.greenAccent.shade400;
  static final rightMessage = Colors.green.shade300;
  static final wrongMessage = Colors.red.shade300;
  static final normalMessage = Colors.blue.shade200;
}
