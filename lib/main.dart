import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:travelogue/home/signup.dart';
import 'package:travelogue/home/signupCopy.dart';

import 'home/home.dart';
import 'home/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
      child: MaterialApp(
        title: 'TraveLoGue',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/signup",
        routes: {
          "/login": ((BuildContext context) => const LoginPage()),
          "/home": ((BuildContext context) => const HomePage()),
          "/signup": ((BuildContext context) => const SignUpPage()),

        },
      ),
    );
  }
}

