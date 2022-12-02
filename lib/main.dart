import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:travelogue/home/signup.dart';

import 'home/home.dart';
import 'home/login.dart';
import 'package:umkm/screens/add_umkm.dart';
import 'package:umkm/screens/umkm_home.dart';
import 'package:forum/forum.dart';

void main() {
  runApp(const MyApp());
}

class LoggedIn {
  static Map<String, String> user_data = {};
  static var userLoggedIn = {};
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'TraveLoGue',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primarySwatch:
              generateMaterialColor(color: Color.fromRGBO(254, 185, 0, 100)),
          
        ),
        initialRoute: "/login",
        routes: {
          "/login": ((BuildContext context) => const LoginPage()),
          HomePage.ROUTE_NAME: ((BuildContext context) => const HomePage()),
          "/signup": ((BuildContext context) => const SignUpPage()),
          AddUMKMPage.ROUTE_NAME: ((BuildContext context) =>
              const AddUMKMPage()),
          UMKMHomePage.ROUTE_NAME: ((BuildContext context) =>
              const UMKMHomePage()),
          ForumHomePage.ROUTE_NAME: ((BuildContext context) => const ForumHomePage()),
        },
      ),
    );
  }
}
