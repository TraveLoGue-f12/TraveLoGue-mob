import 'package:planner/models/plan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Plan>> fetch(String username) async {
  var url = Uri.parse('https://trave-lo-gue.up.railway.app/planner/jsonflutter/$username');
  var response = await http.get(
    url,
    headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Plan> plans = [];
  for (var d in data) {
    if (d != null) {
        plans.add(Plan.fromJson(d));
    }
  }

  return plans;
}