import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';

import '../widgets/inherited_characters.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({Key? key, required this.onTap}) : super(key: key);
  final Function(Character) onTap;

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  @override
  Widget build(BuildContext context) {
    final InheritedCharacters data =
        context.dependOnInheritedWidgetOfExactType<InheritedCharacters>()!;

    return Scaffold(
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
                    onTap: () => widget.onTap(character),
                  ))
              .toList()),
    );
  }
}
