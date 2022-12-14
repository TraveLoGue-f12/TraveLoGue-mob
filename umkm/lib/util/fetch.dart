// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/umkm_model.dart';

Future<List<UMKM>> fetchUMKM() async {
  var url = Uri.parse(
      'https://trave-lo-gue.up.railway.app/local-shops/json/');
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
  
  List<UMKM> listUMKM = [];
    for (var d in data) {

      
      print(d);
      if (d != null) {
        listUMKM.add(UMKM.fromJson(d));
      }
     
    }
  
  

  return listUMKM;
}