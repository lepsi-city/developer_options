import 'dart:convert';

class DeveloperOptionsModel {
  bool enabled;
  Map<String, bool> options = {};
  Map<String, String> strings = {};

  DeveloperOptionsModel({this.enabled = false, this.options = const {}, this.strings = const {}});

  factory DeveloperOptionsModel.fromJson(Map<String, dynamic?> json) {
    return DeveloperOptionsModel(
      enabled: json["enabled"] ?? false,
      options: jsonDecode(json["options"]) ?? {},
      strings: jsonDecode(json["strings"]) ?? {},
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
