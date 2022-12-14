import 'package:flutter/material.dart';
import 'package:harry_potter/services/database.dart';

import '../models/character.dart';

class CharacterData extends ChangeNotifier {
  List<Character> characters = [];

  CharacterData() {
    init();
  }

  Character getCharacter(int id) {
    return characters.firstWhere((element) => element.id == id);
  }

  void toggleFavorite(Character character) {
    character.favorite = !character.favorite;
    Database.instance.saveCharacter(character);
    notifyListeners();
  }

  Future<void> init() async {
    characters = await Database.instance.getAllCharacters();
    if (characters.isEmpty) await initCharacters();
    notifyListeners();
  }

  Future<void> initCharacters() async {
    await Database.instance.saveCharacter(Character(
        "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg/revision/latest?cb=20160903184919",
        "Harry Potter",
        8,
        9,
        7));
    await Database.instance.saveCharacter(Character(
        "https://static.wikia.nocookie.net/esharrypotter/images/d/d5/P7_Hermione_Granger_nuevo_perfil.jpg/revision/latest?cb=20220609032923",
        "Hermione Granger",
        9,
        10,
        8));
    await Database.instance.saveCharacter(Character(
        "https://static.wikia.nocookie.net/esharrypotter/images/6/69/P7_promo_Ron_Weasley.jpg/revision/latest?cb=20150523213430",
        "Ron Weasley",
        9,
        8,
        7));
    characters = await Database.instance.getAllCharacters();
  }
}
