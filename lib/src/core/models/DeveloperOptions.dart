import 'dart:convert';

class DeveloperOptionsModel {
  bool enabled;

  DeveloperOptionsModel({this.enabled = false});

  factory DeveloperOptionsModel.fromJson(Map<String, dynamic?> json) {
    return DeveloperOptionsModel(
      enabled: json["enabled"] ?? false
    );
  }

  factory DeveloperOptionsModel.fromString(String jsonString) {
    return DeveloperOptionsModel.fromJson(jsonDecode(jsonString));
  }

  Map<String, dynamic> toJson() {
    return {
      'enabled': this.enabled,
    };
  }

  String toString() {
    return jsonEncode(toJson());
  }
}
