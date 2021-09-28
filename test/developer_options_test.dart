import 'package:developer_options/developer_options.dart';
import 'package:developer_options/src/core/models/developer_options.dart';
import 'package:test/test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart' as flutter_test;

void main() {
  group("DeveloperOptions", () {
    DeveloperOptionsModel mockdata = DeveloperOptionsModel.fromJson({
      "enabled": true,
      "options": {"testValue1": true},
      "strings": {"testValue2": "test"},
    });

    test('load DeveloperOptions and verify if enabled', () async {
      SharedPreferences.setMockInitialValues({
        "PKG_DEVELOPER_OPTIONS_KEY_DEVELOPER_OPTIONS": mockdata.toString(),
      });

      flutter_test.TestWidgetsFlutterBinding.ensureInitialized();
      DeveloperOptions developerOptions = DeveloperOptions();

      await developerOptions.init();

      expect(developerOptions.isEnabled, true);
    });

    test('load DeveloperOptions and verify retrieved values', () async {
      SharedPreferences.setMockInitialValues({
        "PKG_DEVELOPER_OPTIONS_KEY_DEVELOPER_OPTIONS": mockdata.toString(),
      });

      flutter_test.TestWidgetsFlutterBinding.ensureInitialized();

      DeveloperOptions developerOptions = DeveloperOptions();

      await developerOptions.init();

      expect(developerOptions.getDeveloperString("testValue2"), "test");
    });

    test('load DeveloperOptions and verify retrieved options', () async {
      SharedPreferences.setMockInitialValues({
        "PKG_DEVELOPER_OPTIONS_KEY_DEVELOPER_OPTIONS": mockdata.toString(),
      });

      flutter_test.TestWidgetsFlutterBinding.ensureInitialized();

      DeveloperOptions developerOptions = DeveloperOptions();
      await developerOptions.init();

      expect(developerOptions.getDeveloperOption("testValue1"), true);
    });

    test('save DeveloperOptions and verify retrieved options', () async {
      SharedPreferences.setMockInitialValues({
        "PKG_DEVELOPER_OPTIONS_KEY_DEVELOPER_OPTIONS": mockdata.toString(),
      });

      flutter_test.TestWidgetsFlutterBinding.ensureInitialized();

      DeveloperOptions developerOptions = DeveloperOptions();
      await developerOptions.init();

      await developerOptions.setDeveloperOption("testValue3", true);

      expect(developerOptions.getDeveloperOption("testValue3"), true);
    });
  });
}
