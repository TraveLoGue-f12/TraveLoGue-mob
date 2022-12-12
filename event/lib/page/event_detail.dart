import 'package:flutter/material.dart';
import 'package:travelogue/main.dart';
import 'package:event/event.dart';
import 'package:travelogue/widgets/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:event/page/add_event.dart';
import 'package:event/util/fetch.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;

class EventDetail extends StatelessWidget {

  const EventDetail(
      {super.key,
      required this.title,
      required this.description,
      required this.date,
      required this.place,
      required this.category});

  final String description;
  final String title;
  final String place;
  final DateTime date;
  final String category;

  // String watchStatus(Watched? status) {
  //   if (status == Watched.YES) {
  //     return "watched";
  //   } else {
  //     return "haven't watched";
    // }


  @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Upcoming Event'),
            ),
            drawer: ScfDrawer(), // CLOSE DRAWER
            body: 
            // Container(
            //     padding: const EdgeInsets.all(8),
            //     child: ListView(
            //     shrinkWrap: true,
            //     children: <Widget>[
            //       Center(
            //         child: Text(title.toString() + '\n',
            //           style: TextStyle(
            //           color: Color.fromARGB(255, 0, 0, 0),
            //           fontWeight: FontWeight.bold,
            //           fontSize: 24))),
            //           Row(children: [
            //               Text("Date: ", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            //               Text(date.toString().substring(0, 10), style: const TextStyle(fontSize: 18))
            //             ]),
            //           Row(children: [
            //               Text("Place: ", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            //               Text(place.toString(), style: const TextStyle(fontSize: 18)),
            //               Text("/10", style: const TextStyle(fontSize: 18))
            //             ]),
            //           Row(children: [
            //               Text("Description: ", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            //               Text(description.toString(), style: const TextStyle(fontSize: 18)),
            //             ]),
            //           // Text("Review: ", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            //           // Text(review.toString(), style: const TextStyle(fontSize: 18)),
            //     ],
            //   )
            // ),
            // bottomNavigationBar: Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: SizedBox(
            //     height: 50,
            //     width: 10,
            //     child: TextButton(
            //             child: const Text(
            //               "Back",
            //               style: TextStyle(color: Colors.white),
            //             ),
            //             style: ButtonStyle(
            //               backgroundColor: MaterialStateProperty.all(Colors.blue),
            //             ),
            //             onPressed: () {
            //               Navigator.pop(
            //                 context,
            //               );
            //             },
            //           ),
            //   )
            // ),
          Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    title.toString(),
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                                text: 'Event Date: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: date.toString()),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                                text: 'Place: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: place.toString()),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                                text: 'Description: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: description.toString()),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(254, 185, 0, 100)),
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
              child: const Text(
                "Back",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
    }
}
