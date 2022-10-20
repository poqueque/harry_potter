import 'package:flutter/material.dart';

import '../models/character.dart';

class InheritedCharacters extends InheritedWidget {
  InheritedCharacters({super.key, required super.child});

  final List<Character> characters = [
    Character(
        1,
        "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg/revision/latest?cb=20160903184919",
        "Harry Potter",
        8,
        9,
        7),
    Character(
        2,
        "https://static.wikia.nocookie.net/esharrypotter/images/d/d5/P7_Hermione_Granger_nuevo_perfil.jpg/revision/latest?cb=20220609032923",
        "Hermione Granger",
        9,
        10,
        8),
    Character(
        3,
        "https://static.wikia.nocookie.net/esharrypotter/images/6/69/P7_promo_Ron_Weasley.jpg/revision/latest?cb=20150523213430",
        "Ron Weasley",
        9,
        8,
        7)
  ];

  final List<Character> favorites = [];

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  void toggleFavorite(Character character) {
    if (favorites.contains(character)) {
      favorites.remove(character);
    } else {
      favorites.add(character);
    }
  }
}
