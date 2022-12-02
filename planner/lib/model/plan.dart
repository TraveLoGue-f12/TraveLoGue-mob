// To parse this JSON data, do
//
//     final plan = planFromJson(jsonString);

import 'dart:convert';

List<Plan> planFromJson(String str) => List<Plan>.from(json.decode(str).map((x) => Plan.fromJson(x)));

String planToJson(List<Plan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Plan {
    Plan({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Plan.fromJson(Map<String, dynamic> json) => Plan(
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
        required this.name,
        required this.tripDate,
        required this.startDate,
        required this.endDate,
        required this.notes,
        required this.image,
    });

    int user;
    String name;
    String tripDate;
    DateTime startDate;
    DateTime endDate;
    String notes;
    String image;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        tripDate: json["trip_date"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        notes: json["notes"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "trip_date": tripDate,
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "notes": notes,
        "image": image,
    };
}
