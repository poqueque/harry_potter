import 'package:harry_potter/models/character.dart';
import 'package:isar/isar.dart';

class Database {
  static Database? _instance;

  late Isar isar;

  static Database get instance {
    _instance ??= Database();
    return _instance!;
  }

  static Future<void> init() async {
    _instance ??= Database();
    _instance!.isar = await Isar.open([CharacterSchema]);
  }

  Future<int> saveCharacter(Character character) async {
    int id = 0;
    await isar.writeTxn(() async {
      id = await isar.characters.put(character);
    });
    return id;
  }

  Future<List<Character>> getAllCharacters() async =>
      await isar.characters.where().findAll();
}
