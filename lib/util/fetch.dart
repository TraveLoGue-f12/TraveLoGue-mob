import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'dart:convert' as convert;

import '../main.dart';

CookieRequest request = CookieRequest();

List<String?> getCred() {
  var username = LoggedIn.user_data['username'];
  var password = LoggedIn.user_data['password'];

  return [username,password];
}

getData(loginData) async {

  var data = convert.jsonEncode(
    <String, String?>{
      'username1': loginData[0],
      'password1': loginData[1],
    },
  );

  final response =
      await request.postJson("https://trave-lo-gue.up.railway.app/auth/register/", data);

  print(response);
}
