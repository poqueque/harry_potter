import 'package:flutter/material.dart';
import 'package:harry_potter/screens/character_detail.dart';
import 'package:harry_potter/screens/character_list.dart';
import 'package:harry_potter/screens/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/character.dart';

class AdaptivePage extends StatefulWidget {
  const AdaptivePage({Key? key}) : super(key: key);

  @override
  State<AdaptivePage> createState() => _AdaptivePageState();
}

class _AdaptivePageState extends State<AdaptivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.characters("Hogwarts")),
        actions: [
          InkWell(
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
              setState(() {});
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.settings),
            ),
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return CharacterList(
              onTap: (character) async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CharacterDetail(character.id, showAppBar: true)));
                setState(() {});
              },
            );
          } else {
            return const WideLayout();
          }
        },
      ),
    );
  }
}

class WideLayout extends StatefulWidget {
  const WideLayout({Key? key}) : super(key: key);

  @override
  State<WideLayout> createState() => _WideLayoutState();
}

class _WideLayoutState extends State<WideLayout> {
  Character? character;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 1,
            child: CharacterList(onTap: (tappedCharacter) {
              character = tappedCharacter;
              setState(() {});
            })),
        Flexible(
            flex: 2,
            child: character == null
                ? Container()
                : CharacterDetail(
                    character!.id,
                    showAppBar: false,
                  )),
      ],
    );
  }
}
