import 'dart:convert';

class DeveloperOptionsModel {
  bool enabled;
  Map<String, dynamic> options = Map();
  Map<String, dynamic> strings = Map();

  DeveloperOptionsModel(
      {this.enabled = false, required this.options, required this.strings});

  factory DeveloperOptionsModel.fromJson(Map<String, dynamic> json) {
    return DeveloperOptionsModel(
      enabled: json["enabled"] ?? false,
      options: json["options"] ?? Map(),
      strings: json["strings"] ?? Map(),
    );
  }

  factory DeveloperOptionsModel.fromString(String jsonString) {
    return DeveloperOptionsModel.fromJson(jsonDecode(jsonString));
  }

  Map<String, dynamic> toJson() {
    return {
      'enabled': this.enabled,
      'options': this.options,
      'strings': this.strings,
    };
  }

  String toString() {
    return jsonEncode(toJson());
  }
}
