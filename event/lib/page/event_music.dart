library event;

import 'package:event/page/event_detail.dart';
import 'package:flutter/material.dart';
import 'package:travelogue/main.dart';
import 'package:event/event.dart';
import 'package:travelogue/widgets/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:event/page/add_event.dart';
import 'package:event/util/fetch.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;

class EventMusicHomePage extends StatefulWidget {
  static const ROUTE_NAME = "/event-music";
  const EventMusicHomePage({super.key});

  @override
  State<EventMusicHomePage> createState() => _EventMusicHomePageState();
}

class _EventMusicHomePageState extends State<EventMusicHomePage> {
  var userLoggedIn = LoggedIn.userLoggedIn;
  Color buttonColor = Color.fromRGBO(254, 185, 0, 100);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      floatingActionButton: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, EventHomePage.ROUTE_NAME);
            },
      child: Icon(Icons.add)),
      appBar: AppBar(
        title: const Text(
          'Upcoming Events',
          style: TextStyle(),
        ),
      ),
      drawer: ScfDrawer(),
      body: ListView(
        children: [
          Container(
            // margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              // children: [
              //   Expanded(
              //     child: ListView(
              //       physics: const BouncingScrollPhysics(),
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 250,
                      width: double.infinity,
                      // color: Colors.black.withOpacity(0.2),
                      child: Image.asset(
                        "assets/images/event-header.jpg",
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                      ),
                    ),
                    Column(
                      children: const [
                        SizedBox(
                            // width: double.infinity,
                            // height:
                            // height: 90,
                            ),
                        Text(
                          'Music',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255)),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                            // width: double.infinity,
                            // height: 110,
                            ),
                        Text(
                          'Enjoy your trip to Indonesia by visiting local events. Find the upcoming events here.',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 251, 208, 67)),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  ],
                ),
              ],
              // ),
              // ),
              // ],
            ),
          ),
          
        ],
      ),
    );
  }
}
