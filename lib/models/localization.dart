import 'dart:convert';

class Localization {
  final String key;
  final String value;

  Localization({required this.key, required this.value});

  factory Localization.fromJson(Map<String, dynamic> json) => Localization(
    key: (json['Key'] ?? json['key'] ?? '').toString(),
    value: (json['Value'] ?? json['value'] ?? '').toString(),
  );

  Map<String, dynamic> toJson() => {'Key': key, 'Value': value};

  static List<Localization> listFromJson(String source) =>
      (json.decode(source) as List)
          .map((e) => Localization.fromJson(e))
          .toList();
}
