import 'package:flutter/material.dart';
import 'package:harry_potter/screens/adaptive_page.dart';

import '../services/database.dart';
import '../services/preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String _status = "Inicialitzant l'app...";

  @override
  void initState() {
    super.initState();
    workFlow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(
              size: 100,
            ),
            const SizedBox(
              height: 32,
            ),
            Text(_status),
          ],
        ),
      ),
    );
  }

  void workFlow() async {
    await Preferences.init();
    _status = "Preferences initialised";
    setState(() {});

    await Database.init();
    _status = "Database initialised";
    setState(() {});

    if (!mounted) return;
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const AdaptivePage()));
  }
}
