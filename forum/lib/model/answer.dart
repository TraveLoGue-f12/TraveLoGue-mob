import 'dart:convert';

List<Answer> answerFromJson(String str) => List<Answer>.from(json.decode(str).map((x) => Answer.fromJson(x)));

String answerToJson(List<Answer> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Answer {
    Answer({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Answer.fromJson(Map<String, dynamic> json) => Answer(
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
        required this.question,
        required this.date,
        required this.answer,
    });

    int user;
    String username;
    int question;
    DateTime date;
    String answer;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        username: json["username"],
        question: json["question"],
        date: DateTime.parse(json["date"]),
        answer: json["answer"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "username": username,
        "question": question,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "answer": answer,
    };
}
