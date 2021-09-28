import 'dart:convert';

class DeveloperOptionsModel {
  bool enabled;
  Map<String, dynamic> options = {};
  Map<String, dynamic> strings = {};

  DeveloperOptionsModel(
      {this.enabled = false, required this.options, required this.strings});

  factory DeveloperOptionsModel.fromJson(Map<String, dynamic> json) {
    return DeveloperOptionsModel(
      enabled: json["enabled"] ?? false,
      options: json["options"] ?? {},
      strings: json["strings"] ?? {},
    );
  }

  factory DeveloperOptionsModel.fromString(String jsonString) {
    return DeveloperOptionsModel.fromJson(jsonDecode(jsonString));
  }

  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
      'options': options,
      'strings': strings,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
