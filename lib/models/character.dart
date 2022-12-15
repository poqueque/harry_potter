import 'package:isar/isar.dart';

part 'character.g.dart';

@collection
class Character {
  Id id = Isar.autoIncrement;

  final String url, name;
  final int magic, strength, speed;
  int reviews = 0, totalStars = 0;
  bool favorite = false;

  Character(this.url, this.name, this.magic, this.strength, this.speed);
}
