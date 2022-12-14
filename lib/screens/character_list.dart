import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:harry_potter/models/character.dart';
import 'package:provider/provider.dart';

import '../models/character_data.dart';
import '../services/preferences.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({Key? key, required this.onTap}) : super(key: key);
  final Function(Character) onTap;

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CharacterData>(builder: (context, data, child) {
        return ListView(
            children: data.characters
                .map((character) => ListTile(
                      leading: Hero(
                          tag: "${character.id}",
                          child: Image.network(character.url)),
                      title: Text(character.name),
                      subtitle: (Preferences.instance.showSubtitles)
                          ? Text(
                              "${AppLocalizations.of(context)!.magic}: ${character.magic}")
                          : null,
                      trailing: (character.favorite)
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_outline),
                      onTap: () => widget.onTap(character),
                    ))
                .toList());
      }),
    );
  }
}
