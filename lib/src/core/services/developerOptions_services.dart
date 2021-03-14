import 'package:shared_preferences/shared_preferences.dart';

import 'package:developer_options/src/core/models/DeveloperOptions.dart';

class DeveloperOptionsService {
  DeveloperOptionsModel _developerOptions = DeveloperOptionsModel(options: Map(), strings: Map()); //TODO: Refactor
  late SharedPreferences _prefs;
  bool? started;
  bool isEnabled = false;
  static const KEY_DEVELOPER_OPTIONS = "PKG_DEVELOPER_OPTIONS_KEY_DEVELOPER_OPTIONS";

  Future<bool> init() async {
    _prefs = await SharedPreferences.getInstance();
    print("got string");
    String debugTest = _prefs.getString(KEY_DEVELOPER_OPTIONS) ?? "{}";
    print(debugTest);
    print("got debug test");
    print(debugTest.runtimeType);

    _developerOptions = DeveloperOptionsModel.fromString(debugTest);
    print("Got developerOptions");
    isEnabled = _developerOptions.enabled;
    started = true;
    return true;
  }

  Future _saveDeveloperOptions() async {
    _prefs.setString(KEY_DEVELOPER_OPTIONS, _developerOptions.toString());
  }

  setDeveloperStatus(bool enabled) {
    _developerOptions.enabled = enabled;
    isEnabled = enabled;
    _saveDeveloperOptions();
  }

  bool getDeveloperStatus() {
    return _developerOptions.enabled;
  }

  setDeveloperOption(String key, bool value) {
    _developerOptions.options[key] = value;
  }

  bool? getDeveloperOption(String key) {
    return _developerOptions.options[key];
  }

  setDeveloperString(String key, String value) {
    _developerOptions.strings[key] = value;
  }

  String? getDeveloperString(String key) {
    return _developerOptions.strings[key];
  }
}
