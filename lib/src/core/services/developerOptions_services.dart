import 'package:shared_preferences/shared_preferences.dart';

import 'package:developer_options/src/core/models/DeveloperOptions.dart';

class DeveloperOptionsService {
  DeveloperOptionsModel _developerOptions = DeveloperOptionsModel();
  late SharedPreferences _prefs;
  bool? started;
  bool isEnabled = false;
  static const KEY_DEVELOPER_OPTIONS = "KEY_DEVELOPER_OPTIONS";

  Future<bool> init() async {
    _prefs = await SharedPreferences.getInstance();
    _developerOptions = DeveloperOptionsModel.fromString(_prefs.getString(KEY_DEVELOPER_OPTIONS) ?? "{}");
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
}
