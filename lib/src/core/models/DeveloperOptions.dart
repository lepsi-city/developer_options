import 'dart:convert';

class DeveloperOptionsModel {
  bool enabled;
  Map<String, dynamic> options = Map();
  Map<String, dynamic> strings = Map();

  DeveloperOptionsModel({this.enabled = false, required this.options, required this.strings});

  factory DeveloperOptionsModel.fromJson(Map<String, dynamic?> json) {
    print("got here - from json");
    print(json["options"].runtimeType);
    print(json["strings"].runtimeType);
    print("testing231");
    return DeveloperOptionsModel(
      enabled: json["enabled"] ?? false,
      options: json["options"] ?? Map(),//jsonDecode(json["options"] ?? "{}") ?? Map(),
      strings: json["strings"] ?? Map(),//jsonDecode(json["strings"] ?? "{}") ?? Map(),
    );
  }

  factory DeveloperOptionsModel.fromString(String jsonString) {
    print("fromString");
    Map<String, dynamic> json = jsonDecode(jsonString);
    print(json);
    print(json.runtimeType);
    print("decoded");
    return DeveloperOptionsModel.fromJson(json);
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
