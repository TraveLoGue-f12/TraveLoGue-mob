// To parse this JSON data, do
//
//     final question = questionFromJson(jsonString);

import 'dart:convert';

List<Question> questionFromJson(String str) => List<Question>.from(json.decode(str).map((x) => Question.fromJson(x)));

String questionToJson(List<Question> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Question {
    Question({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Question.fromJson(Map<String, dynamic> json) => Question(
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
        required this.username,
        required this.date,
        required this.title,
        required this.question,
        required this.isAnswered,
    });

    int user;
    String username;
    DateTime date;
    String title;
    String question;
    bool isAnswered;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        username: json["username"],
        date: DateTime.parse(json["date"]),
        title: json["title"],
        question: json["question"],
        isAnswered: json["is_answered"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "username": username,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "title": title,
        "question": question,
        "is_answered": isAnswered,
    };
}
