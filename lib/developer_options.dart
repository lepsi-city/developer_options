library developer_options;

class DeveloperOptionsService {
  late DeveloperOptionsService _developerOptionsService;
  bool started = false;
  bool isEnabled = false;
  static const KEY_DEVELOPER_OPTIONS = "KEY_DEVELOPER_OPTIONS";

  Future<bool> init() async {
    await _developerOptionsService.init();
    isEnabled = _developerOptionsService.isEnabled;
    started = true;
    return true;
  }

  setDeveloperStatus(bool enabled) {
    _developerOptionsService.setDeveloperStatus(enabled);
  }

  bool getDeveloperStatus() {
    return _developerOptionsService.getDeveloperStatus();
  }

  Future<bool> getDeveloperStatusFuture() async {
    if(started) {
      return _developerOptionsService.getDeveloperStatus();
    }
    else {
      await init();
      return _developerOptionsService.getDeveloperStatus();
    }
  }

}
