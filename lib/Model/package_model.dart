// To parse this JSON data, do
//
//     final package = packageFromJson(jsonString);

import 'dart:convert';

Package packageFromJson(String str) => Package.fromJson(json.decode(str));

String packageToJson(Package data) => json.encode(data.toJson());

class Package {
  List<String> duration;
  List<String> package;

  Package({
    required this.duration,
    required this.package,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    duration: List<String>.from(json["duration"].map((x) => x)),
    package: List<String>.from(json["package"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "duration": List<dynamic>.from(duration.map((x) => x)),
    "package": List<dynamic>.from(package.map((x) => x)),
  };
}
