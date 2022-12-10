library event;

import 'package:flutter/material.dart';
import 'package:travelogue/main.dart';
import 'package:travelogue/widgets/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:event/page/add_event.dart';
import 'package:event/util/fetch.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;

class EventHomePage extends StatefulWidget {
  static const ROUTE_NAME = "/event";
  const EventHomePage({super.key});

  @override
  State<EventHomePage> createState() => _EventHomePageState();
}

class _EventHomePageState extends State<EventHomePage> {
  var userLoggedIn = LoggedIn.userLoggedIn;
  Color buttonColor = Color.fromRGBO(254, 185, 0, 100);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      floatingActionButton: Visibility(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AddEventPage.ROUTE_NAME);
            },
            child: Icon(Icons.add)),
        visible: userLoggedIn['status'] == 'L' ? true : false,
      ),
      appBar: AppBar(
        title: const Text(
          'Upcoming Events',
          style: TextStyle(),
        ),
      ),
      drawer: ScfDrawer(),
      body: FutureBuilder(
          future: fetchEvent(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromRGBO(254, 185, 0, 100))));
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "There is no data yet :(",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          // gridDelegate:
                          //     SliverGridDelegateWithFixedCrossAxisCount(
                          //         crossAxisCount: 2),
                          itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: buttonColor),
                                    borderRadius: BorderRadius.circular(12.0),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromARGB(
                                              255, 180, 167, 167),
                                          blurRadius: 1.0)
                                    ]),
                                // child: ListTile(
                                //   // onTap: () {},
                                //   title: Text(
                                //     "${snapshot.data![index].fields.title}",
                                //     style: const TextStyle(
                                //       fontSize: 16.0,
                                //     ),
                                //   ),
                                //   subtitle: Text(
                                //     "${snapshot.data![index].fields.place}",
                                //     style: const TextStyle(
                                //       fontSize: 16.0,
                                //     ),
                                //   ),
                              )),
                    ),
                  ],
                );
              }
            }
          }),
    );
  }
}

// /// A Calculator.
// class Calculator {
//   /// Returns [value] plus 1.
//   int addOne(int value) => value + 1;
// }
