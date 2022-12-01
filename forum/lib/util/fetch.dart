// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/question.dart';
import '../model/answer.dart';

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

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    
    // melakukan konversi data json menjadi object ToDo
    
    List<Question> listQuestion = [];
        for (var d in data) {

        
        if (d != null) {
            listQuestion.add(Question.fromJson(d));
        }
        }
    
    return listQuestion;
}

/* Future<List<Answer>> fetchAnswer() async {
    var url = Uri.parse(
        'https://trave-lo-gue.up.railway.app/forum/all_answer_json/');
    var response = await http.get(
        url,
        headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
        },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    
    // melakukan konversi data json menjadi object ToDo
    
    List<UMKM> listAnswer = [];
        for (var d in data) {

        
        if (d != null) {
            listAnswer.add(UMKM.fromJson(d));
        }
        }
    
    return listAnswer;
} */