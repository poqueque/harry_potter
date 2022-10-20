import 'package:flutter/material.dart';
import 'package:harry_potter/screens/character_detail.dart';

import '../widgets/inherited_characters.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({Key? key}) : super(key: key);

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  @override
  Widget build(BuildContext context) {
    final InheritedCharacters data =
        context.dependOnInheritedWidgetOfExactType<InheritedCharacters>()!;

    return Scaffold(
      appBar: AppBar(title: const Text("Personatges")),
      body: ListView(
          children: data.characters
              .map((character) => ListTile(
                    leading: Hero(
                        tag: "${character.id}",
                        child: Image.network(character.url)),
                    title: Text(character.name),
                    subtitle: Text("Màgia: ${character.magic}"),
                    trailing: (data.favorites.contains(character))
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_outline),
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CharacterDetail(character)));
                      setState(() {});
                    },
                  ))
              .toList()),
    );
  }
}
