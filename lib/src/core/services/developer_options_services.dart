import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:developer_options/src/core/models/developer_options.dart';

class DeveloperOptionsService {
  DeveloperOptionsModel _developerOptions =
      DeveloperOptionsModel(options: {}, strings: {}); //TODO: Refactor
  late SharedPreferences _prefs;
  bool? started;
  bool isEnabled = false;
  static const keyDeveloperOptions =
      "PKG_DEVELOPER_OPTIONS_KEY_DEVELOPER_OPTIONS";

  Future<bool> init() async {
    _prefs = await SharedPreferences.getInstance();
    String optionString;
    if (kReleaseMode) {
      optionString = _prefs.getString(keyDeveloperOptions) ?? "{}";
    } else {
      optionString =
          _prefs.getString(keyDeveloperOptions) ?? "{\"enabled\":true}";
    }
    _developerOptions = DeveloperOptionsModel.fromString(optionString);
    isEnabled = _developerOptions.enabled;
    started = true;
    return true;
  }

  Future _saveDeveloperOptions() async {
    await _prefs.setString(keyDeveloperOptions, _developerOptions.toString());
  }

  setDeveloperStatus(bool enabled) async {
    _developerOptions.enabled = enabled;
    isEnabled = enabled;
    await _saveDeveloperOptions();
  }

  bool getDeveloperStatus() {
    return _developerOptions.enabled;
  }

  setDeveloperOption(String key, bool value) async {
    _developerOptions.options[key] = value;
    await _saveDeveloperOptions();
  }

  bool? getDeveloperOption(String key) {
    return _developerOptions.options[key];
  }

  setDeveloperString(String key, String value) async {
    _developerOptions.strings[key] = value;
    await _saveDeveloperOptions();
  }

  String? getDeveloperString(String key) {
    return _developerOptions.strings[key];
  }
}
