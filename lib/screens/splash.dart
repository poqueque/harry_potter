import 'package:flutter/material.dart';
import 'package:harry_potter/screens/adaptive_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../services/database.dart';
import '../services/preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String _status = "";

  @override
  void initState() {
    super.initState();
    workFlow();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _status = AppLocalizations.of(context)!.initApp;
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
    if (!mounted) return;
    _status = AppLocalizations.of(context)!.initPrefs;
    setState(() {});

    await Database.init();
    if (!mounted) return;
    _status = AppLocalizations.of(context)!.initDB;
    setState(() {});

    if (!mounted) return;
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const AdaptivePage()));
  }
}
