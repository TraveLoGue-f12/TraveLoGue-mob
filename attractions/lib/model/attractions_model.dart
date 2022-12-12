// To parse this JSON data, do
//
//     final ObjekWisata = ObjekWisataFromJson(jsonString);

import 'dart:convert';

List<ObjekWisata> ObjekWisataFromJson(String str) => List<ObjekWisata>.from(
    json.decode(str).map((x) => ObjekWisata.fromJson(x)));

String ObjekWisataToJson(List<ObjekWisata> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ObjekWisata {
  ObjekWisata({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory ObjekWisata.fromJson(Map<String, dynamic> json) => ObjekWisata(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.user,
    required this.title,
    required this.description,
    required this.location,
    required this.addressLink,
  });

  int? user;
  String title;
  String description;
  String location;
  String addressLink;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        title: json["title"],
        description: json["description"],
        location: json["location"],
        addressLink: json["address_link"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "title": title,
        "description": description,
        "location": location,
        "address_link": addressLink,
      };
}
