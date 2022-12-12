// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/event_model.dart';

Future<List<Event>> fetchEvent() async {
  var url = Uri.parse(
      'https://trave-lo-gue.up.railway.app/event/json/');
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
  
  List<Event> listEvent = [];
    for (var d in data) {

      
      print(d);
      if (d != null) {
        listEvent.add(Event.fromJson(d));
      }
      for (int i = 0; i < listEvent.length; i++){
        print(listEvent[i].toString());
      }
    }
  
  

  return listEvent;
}