import 'package:flutter/material.dart';
import 'package:harry_potter/services/database.dart';

import '../models/character.dart';

class CharacterData extends ChangeNotifier {

  List<Character> characters = [];

  CharacterData() {
    init();
  }

  Character getCharacter(int id){
    return characters.firstWhere((element) => element.id == id);
  }

  void toggleFavorite(Character character) {
    character.favorite = !character.favorite;
    Database.instance.saveCharacter(character);
    notifyListeners();
  }

  Future<void> init() async {
    characters = await Database.instance.getAllCharacters();
    notifyListeners();
  }
}
