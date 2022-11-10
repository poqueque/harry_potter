import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';

import '../widgets/inherited_characters.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail(this.character, {Key? key, required this.showAppBar}) : super(key: key);
  final Character character;
  final bool showAppBar;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  int reviews = 0;
  int totalStars = 0;

  @override
  Widget build(BuildContext context) {
    final InheritedCharacters data =
        context.dependOnInheritedWidgetOfExactType<InheritedCharacters>()!;

    return Scaffold(
      appBar: MediaQuery.of(context).orientation == Orientation.portrait ?
        AppBar(title: Text(widget.character.name)) : null,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Hero(
                  tag: "${widget.character.id}",
                  child: Image.network(
                    widget.character.url,
                    width: 300,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Rating(value: (reviews == 0) ? 0 : (totalStars ~/ reviews)),
                    Text("$reviews reviews"),
                  ],
                ),
                Text(
                  widget.character.name,
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
                          reviews++;
                          totalStars += value + 1;
                        });
                      },
                    ),
                    InkWell(
                      child: Icon(
                        (data.favorites.contains(widget.character)) ? Icons.favorite : Icons.favorite_outline,
                        color: Colors.blue,
                      ),
                      onTap: () {
                        data.toggleFavorite(widget.character);
                        setState(() {});
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.fitness_center),
                        const Text("Fuerza"),
                        Text("${widget.character.strength}"),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.auto_fix_normal),
                        const Text("Màgia"),
                        Text("${widget.character.magic}")
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.speed),
                        const Text("Velocidad"),
                        Text("${widget.character.speed}")
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
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
