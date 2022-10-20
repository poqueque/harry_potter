import 'package:flutter/material.dart';
import 'package:harry_potter/screens/character_list.dart';
import 'package:harry_potter/widgets/inherited_characters.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InheritedCharacters(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CharacterList(),
      ),
    );
  }
}
