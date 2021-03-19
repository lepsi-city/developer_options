library developer_options;

import 'package:developer_options/src/core/services/developerOptions_services.dart';

class DeveloperOptions {
  DeveloperOptionsService _developerOptionsService = DeveloperOptionsService();
  bool started = false;
  bool isEnabled = false;

  Future<bool> init() async {
    await _developerOptionsService.init();
    isEnabled = _developerOptionsService.isEnabled;
    started = true;
    return true;
  }

  setDeveloperStatus(bool enabled) async {
    await  _developerOptionsService.setDeveloperStatus(enabled);
  }

  setDeveloperOption(String key, bool value) async {
    await _developerOptionsService.setDeveloperOption(key, value);
  }

  setDeveloperString(String key, String value) async {
    await _developerOptionsService.setDeveloperString(key, value);
  }

  bool getDeveloperStatus() {
    return _developerOptionsService.getDeveloperStatus();
  }

  bool? getDeveloperOption(String key) {
    return _developerOptionsService.getDeveloperOption(key);
  }

  bool getDeveloperOptionNullSafe(String key) {
    return getDeveloperOption(key) ?? false;
  }

  String? getDeveloperString(String key) {
    return _developerOptionsService.getDeveloperString(key);
  }

  String getDeveloperStringNullSafe(String key) {
    return getDeveloperString(key) ?? "";
  }
}
