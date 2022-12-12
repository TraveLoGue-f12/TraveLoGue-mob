import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/attractions_model.dart';

Future<List<ObjekWisata>> fetchObjekWisata() async {
  var url = Uri.parse(
    'https://trave-lo-gue.up.railway.app/attraction/json/');
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

  List<ObjekWisata> listObjekWisata = [];
  for (var d in data) {
    print(d);
    if (d != null) {
      listObjekWisata.add(ObjekWisata.fromJson(d));
    }
  }

  return listObjekWisata;
}
