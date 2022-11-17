import 'package:isar/isar.dart';

part 'character.g.dart';

@collection
class Character {
  Id id = Isar.autoIncrement;

  final String url;
  final String name;
  final int magic;
  final int strength;
  final int speed;
  int reviews = 0;
  int totalStars = 0;
  bool favorite = false;

  Character(this.url, this.name, this.magic, this.strength, this.speed);
}