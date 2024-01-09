// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int id;
  String firstName;
  String lastName;
  String about;
  List<Tag> tags;
  List<String> favoriteSocialMedia;
  int salary;
  String email;
  DateTime birthDate;
  int gender;
  Type type;
  String avatar;
  String accessToken;


  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.about,
    required this.tags,
    required this.favoriteSocialMedia,
    required this.salary,
    required this.email,
    required this.birthDate,
    required this.gender,
    required this.type,
    required this.avatar,
    required this.accessToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    about: json["about"],
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    favoriteSocialMedia: List<String>.from(json["favorite_social_media"].map((x) => x)),
    salary: json["salary"],
    email: json["email"],
    birthDate: DateTime.parse(json["birth_date"]),
    gender: json["gender"],
    type: Type.fromJson(json["type"]),
    avatar: json["avatar"],
    accessToken: json["access_token"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "about": about,
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    "favorite_social_media": List<dynamic>.from(favoriteSocialMedia.map((x) => x)),
    "salary": salary,
    "email": email,
    "birth_date": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "type": type.toJson(),
    "avatar": avatar,
    "access_token": accessToken,
  };
}

class Tag {
  int id;
  String name;

  Tag({
    required this.id,
    required this.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Type {
  int code;
  String name;
  String niceName;

  Type({
    required this.code,
    required this.name,
    required this.niceName,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    code: json["code"],
    name: json["name"],
    niceName: json["nice_name"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "nice_name": niceName,
  };
}
