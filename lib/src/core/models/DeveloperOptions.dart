import 'dart:convert';

class DeveloperOptionsModel {
  bool enabled;
  Map<String, bool> options = Map();
  Map<String, String> strings = Map();

  DeveloperOptionsModel({this.enabled = false, required this.options, required this.strings});

  factory DeveloperOptionsModel.fromJson(Map<String, dynamic?> json) {
    return DeveloperOptionsModel(
      enabled: json["enabled"] ?? false,
      options: jsonDecode(json["options"]) ?? Map(),
      strings: jsonDecode(json["strings"]) ?? Map(),
    );
  }

  factory DeveloperOptionsModel.fromString(String jsonString) {
    return DeveloperOptionsModel.fromJson(jsonDecode(jsonString));
  }

  Map<String, dynamic> toJson() {
    return {
      'enabled': this.enabled,
      'options': this.options,
    };
  }

  String toString() {
    return jsonEncode(toJson());
  }
}
