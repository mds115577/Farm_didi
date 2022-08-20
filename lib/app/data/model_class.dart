// To parse this JSON data, do
//
//     final universityModel = universityModelFromJson(jsonString);

import 'dart:convert';

List<UniversityModel> universityModelFromJson(String str) =>
    List<UniversityModel>.from(
        json.decode(str).map((x) => UniversityModel.fromJson(x)));

String universityModelToJson(List<UniversityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UniversityModel {
  UniversityModel({
    this.domains,
    this.alphaTwoCode,
    this.country,
    this.webPages,
    this.name,
    this.stateProvince,
  });

  List<String>? domains;
  AlphaTwoCode? alphaTwoCode;
  Country? country;
  List<String>? webPages;
  String? name;
  String? stateProvince;

  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      UniversityModel(
        domains: List<String>.from(json["domains"].map((x) => x)),
        alphaTwoCode: alphaTwoCodeValues.map![json["alpha_two_code"]],
        country: countryValues.map![json["country"]],
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        name: json["name"],
        stateProvince: json["state-province"],
      );

  Map<String, dynamic> toJson() => {
        "domains": List<dynamic>.from(domains!.map((x) => x)),
        "alpha_two_code": alphaTwoCodeValues.reverse[alphaTwoCode],
        "country": countryValues.reverse[country],
        "web_pages": List<dynamic>.from(webPages!.map((x) => x)),
        "name": name,
        "state-province": stateProvince,
      };
}

enum AlphaTwoCode { IN }

final alphaTwoCodeValues = EnumValues(map: {"IN": AlphaTwoCode.IN});

enum Country { INDIA }

final countryValues = EnumValues(map: {"India": Country.INDIA});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues({this.map});

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
