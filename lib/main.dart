import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:travelogue/home/signup.dart';
import 'package:planner/screens/planner.dart';


import 'home/home.dart';
import 'home/login.dart';
import 'package:umkm/screens/add_umkm.dart';
import 'package:umkm/screens/umkm_home.dart';
import 'package:planner/screens/add_plan.dart';
import 'package:event/event.dart';
import 'package:event/page/add_event.dart';
import 'package:attractions/attractions.dart';
import 'package:attractions/page/add_attr.dart';

import 'package:forum/page/forum.dart';
import 'package:forum/page/add_question.dart';

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
          PlannerPage.ROUTE_NAME: ((BuildContext context) => const PlannerPage()),
          AddPlanPage.ROUTE_NAME: ((BuildContext context) => const AddPlanPage()),
          
          AddUMKMPage.ROUTE_NAME: ((BuildContext context) =>
              const AddUMKMPage()),
          UMKMHomePage.ROUTE_NAME: ((BuildContext context) =>
              const UMKMHomePage()),

          ForumHomePage.ROUTE_NAME: ((BuildContext context) => 
              const ForumHomePage()),
          AddQuestionPage.ROUTE_NAME: ((BuildContext context) =>
              const AddQuestionPage()),
          
          "/planner": ((BuildContext context) =>
              const PlannerPage()),
          "/event": ((BuildContext context) =>
          const EventHomePage()),
          "/add-event": ((BuildContext context) =>
          const AddEventPage()),
          "/planner": ((BuildContext context) => const PlannerPage()),
          "/attractions": ((BuildContext context) => const AttractionsPage()),
          "/add-attraction": ((BuildContext context) => const AddAttractionsPage()),
        },
      ),
    );
  }
}
