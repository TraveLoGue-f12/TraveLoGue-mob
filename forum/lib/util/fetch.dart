import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:forum/model/question.dart';
import 'package:forum/model/answer.dart';


Future<List<Question>> fetchQuestion() async {
    var url = Uri.parse(
        'https://trave-lo-gue.up.railway.app/forum/question_json/');
    var response = await http.get(
        url,
        headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
        },
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));
        
    List<Question> listQuestion = [];
        for (var d in data) {

        
        if (d != null) {
            listQuestion.add(Question.fromJson(d));
        }
        }
    
    return listQuestion;
}

Future<List<Answer>> fetchAnswer(String pkQuestion) async {
    var url = Uri.parse(
        'https://trave-lo-gue.up.railway.app/forum/answer_json/' + pkQuestion);
    var response = await http.get(
        url,
        headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
        },
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));
        
    List<Answer> listAnswer = [];
        for (var d in data) {

        
        if (d != null) {
            listAnswer.add(Answer.fromJson(d));
        }
        }
    
    return listAnswer;
}