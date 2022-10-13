import 'package:flutter/material.dart';
import 'package:harry_potter/screens/character_detail.dart';

import '../models/character.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({Key? key}) : super(key: key);

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  List<Character> characters = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Personatges")),
      body: ListView(
          children: characters
              .map((character) => ListTile(
                    leading: Hero(
                        tag: "${character.id}",
                        child: Image.network(character.url)),
                    title: Text(character.name),
                    subtitle: Text("Màgia: ${character.magic}"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CharacterDetail(character)));
                    },
                  ))
              .toList()),
    );
  }
}
