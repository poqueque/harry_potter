import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/character_data.dart';
import '../services/database.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail(this.id, {Key? key, required this.showAppBar})
      : super(key: key);
  final int id;
  final bool showAppBar;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterData>(
      builder: (context, data, child) {
        Character character = data.getCharacter(widget.id);
        return Scaffold(
            appBar: MediaQuery.of(context).orientation == Orientation.portrait
                ? AppBar(title: Text(character.name))
                : null,
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Hero(
                      tag: "${character.id}",
                      child: Image.network(
                        character.url,
                        width: 300,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Rating(
                            value: (character.reviews == 0)
                                ? 0
                                : (character.totalStars ~/
                                    character.reviews)),
                        Flexible(
                          child: Text(AppLocalizations.of(context)!.nReviews(character.reviews),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      character.name,
                      style: const TextStyle(fontSize: 30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Rating(
                          value: 0,
                          color: Colors.blue,
                          onClick: (value) {
                            setState(() {
                              character.reviews++;
                              character.totalStars += value + 1;
                              Database.instance.saveCharacter(character);
                            });
                          },
                        ),
                        Consumer<CharacterData>(builder: (context, data, child) {
                          return InkWell(
                            child: Icon(
                              (character.favorite)
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: Colors.blue,
                            ),
                            onTap: () {
                              data.toggleFavorite(character);
                              setState(() {});
                            },
                          );
                        })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Icon(Icons.fitness_center),
                            Text(AppLocalizations.of(context)!.strength),
                            Text("${character.strength}"),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.auto_fix_normal),
                            Text(AppLocalizations.of(context)!.magic),
                            Text("${character.magic}")
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.speed),
                            Text(AppLocalizations.of(context)!.speed),
                            Text("${character.speed}")
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ));
      }
    );
  }
}

class Rating extends StatelessWidget {
  final int value;
  final Color color;
  final Function(int)? onClick;

  const Rating({
    Key? key,
    required this.value,
    this.color = Colors.black,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 5; i++)
          InkWell(
              child: Icon(
                value > i ? Icons.star : Icons.star_border,
                color: color,
              ),
              onTap: () {
                if (onClick != null) onClick!(i);
              }),
      ],
    );
  }
}
