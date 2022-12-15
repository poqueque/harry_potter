import 'package:flutter/material.dart';

import '../services/preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: ListView(
          children: [
            SwitchListTile.adaptive(
                title: const Text("Show subtitles"),
                value: Preferences.instance.showSubtitles,
                onChanged: (value) {
                  Preferences.instance.showSubtitles = value;
                  setState(() {});
                }),
          ],
        ));
  }
}
