import 'package:developer_options/developer_options.dart';
import 'package:test/test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart' as flutter_test;

void main() {
  group("DeveloperOptions", () {
    test('Developer Options should be created and inited successfully', () async {
      SharedPreferences.setMockInitialValues({});
      flutter_test.TestWidgetsFlutterBinding.ensureInitialized();

      DeveloperOptions developerOptions = new DeveloperOptions();
      print("awaiting");
      await developerOptions.init();
      print("successfully awaited");
      expect(developerOptions.isEnabled, false);
    });
  });
}

