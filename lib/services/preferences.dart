import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  static Preferences? _instance;

  SharedPreferences? preferences;

  static Preferences get instance {
    _instance ??= Preferences();
    return _instance!;
  }

  bool get showSubtitles {
    return preferences?.getBool("show_subtitles") ?? true;
  }

  set showSubtitles(bool value) {
    preferences?.setBool("show_subtitles", value);
  }


  static Future<void> init() async {
    _instance ??= Preferences();
    var prefs = await SharedPreferences.getInstance();
    _instance!.preferences = prefs;
  }
}