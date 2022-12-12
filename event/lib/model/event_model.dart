<<<<<<< HEAD
=======
// // To parse this JSON data, do
// //
// //     final event = eventFromJson(jsonString);

// import 'dart:convert';

// List<Event> eventFromJson(String str) => List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

// String eventToJson(List<Event> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Event {
//   Event({
//     required this.model,
//     required this.pk,
//     required this.fields,
//   });

//   String model;
//   int pk;
//   Fields fields;

//   factory Event.fromJson(Map<String, dynamic> json) => Event(
//     model: json["model"],
//     pk: json["pk"],
//     fields: Fields.fromJson(json["fields"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "model": model,
//     "pk": pk,
//     "fields": fields.toJson(),
//   };
// }

// class Fields {
//   Fields({
//     required this.user,
//     required this.date,
//     required this.title,
//     required this.description,
//     required this.place,
//     required this.category,
//   });

//   int user;
//   DateTime date;
//   String title;
//   String description;
//   String place;
//   String category;

//   factory Fields.fromJson(Map<String, dynamic> json) => Fields(
//     user: json["user"],
//     date: DateTime.parse(json["date"]),
//     title: json["title"],
//     description: json["description"],
//     place: json["place"],
//     category: json["category"],
//   );

//   Map<String, dynamic> toJson() => {
//     "user": user,
//     "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
//     "title": title,
//     "description": description,
//     "place": place,
//     "category": category,
//   };
// }

>>>>>>> c1f32fa7850e8335dbffe016361eb1b779d69d7d
import 'dart:convert';

List<Event> eventFromJson(String str) => List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String eventToJson(List<Event> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
    Event({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Event.fromJson(Map<String, dynamic> json) => Event(
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
        required this.date,
        required this.title,
        required this.description,
        required this.place,
        required this.category,
    });

    int? user;
    DateTime date;
    String title;
    String description;
    String place;
    String category;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        date: DateTime.parse(json["date"]),
        title: json["title"],
        description: json["description"],
        place: json["place"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "title": title,
        "description": description,
        "place": place,
        "category": category,
    };
}
<<<<<<< HEAD
=======

>>>>>>> c1f32fa7850e8335dbffe016361eb1b779d69d7d
