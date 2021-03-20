/// Library for setting and getting developer options.
library developer_options;

import 'package:developer_options/src/core/services/developerOptions_services.dart';

class DeveloperOptions {
  DeveloperOptionsService _developerOptionsService = DeveloperOptionsService();
  bool started = false;
  bool isEnabled = false;

  /// Init the package. Must be run to load shared_preferences, and its async
  Future<bool> init() async {
    await _developerOptionsService.init();
    isEnabled = _developerOptionsService.isEnabled;
    started = true;
    return true;
  }

  /// Set developer status.
  setDeveloperStatus(bool enabled) async {
    await _developerOptionsService.setDeveloperStatus(enabled);
  }

  /// Set boolean developer option. If already exist, update value with that key
  setDeveloperOption(String key, bool value) async {
    await _developerOptionsService.setDeveloperOption(key, value);
  }

  /// Set string developer option. If already exist, update value with that key
  setDeveloperString(String key, String value) async {
    await _developerOptionsService.setDeveloperString(key, value);
  }

  /// Get status. In release, it defaults to false, in other cases to true
  bool getDeveloperStatus() {
    return _developerOptionsService.getDeveloperStatus();
  }

  /// Get developer option. It can be null if it doesn't exist yet
  bool? getDeveloperOption(String key) {
    return _developerOptionsService.getDeveloperOption(key);
  }

  /// Get developer option. Returns false if doesn't exist yet
  bool getDeveloperOptionNullSafe(String key) {
    return getDeveloperOption(key) ?? false;
  }

  /// Get developer string. It can be null if it doesn't exist yet
  String? getDeveloperString(String key) {
    return _developerOptionsService.getDeveloperString(key);
  }

  /// Get developer string. Returns false if doesn't exist yet
  String getDeveloperStringNullSafe(String key) {
    return getDeveloperString(key) ?? "";
  }
}
