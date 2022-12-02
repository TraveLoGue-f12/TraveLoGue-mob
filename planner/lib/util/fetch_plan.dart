import 'package:planner/model/plan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Plan>> fetchPlans() async {
  var url = Uri.parse('https://trave-lo-gue.up.railway.app/planner/json');
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
  List<Plan> plans = [];
  for (var d in data) {
    if (d != null) {
        plans.add(Plan.fromJson(d));
    }
  }

  return plans;
}