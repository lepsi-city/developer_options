import 'dart:convert';

class DeveloperOptions {
  bool enabled;

  DeveloperOptions({this.enabled = false});

  factory DeveloperOptions.fromJson(Map<String, dynamic?> json) {
    return DeveloperOptions(
      enabled: json["enabled"] ?? false
    );
  }

  factory DeveloperOptions.fromString(String jsonString) {
    return DeveloperOptions.fromJson(jsonDecode(jsonString));
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
