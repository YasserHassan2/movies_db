// To parse this JSON data, do
//
//     final appLookups = appLookupsFromJson(jsonString);

import 'dart:convert';

AppLookups appLookupsFromJson(String str) => AppLookups.fromJson(json.decode(str));

String appLookupsToJson(AppLookups data) => json.encode(data.toJson());

class AppLookups {
  List<Tag> types;
  List<Tag> tags;
  List<SocialMedia> socialMedia;

  AppLookups({
    required this.types,
    required this.tags,
    required this.socialMedia,
  });

  factory AppLookups.fromJson(Map<String, dynamic> json) => AppLookups(
    types: List<Tag>.from(json["types"].map((x) => Tag.fromJson(x))),
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    socialMedia: List<SocialMedia>.from(json["social_media"].map((x) => SocialMedia.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "types": List<dynamic>.from(types.map((x) => x.toJson())),
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    "social_media": List<dynamic>.from(socialMedia.map((x) => x.toJson())),
  };
}

class SocialMedia {
  String value;
  String label;

  SocialMedia({
    required this.value,
    required this.label,
  });

  factory SocialMedia.fromJson(Map<String, dynamic> json) => SocialMedia(
    value: json["value"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
  };
}

class Tag {
  int value;
  String label;

  Tag({
    required this.value,
    required this.label,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    value: json["value"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
  };
}
