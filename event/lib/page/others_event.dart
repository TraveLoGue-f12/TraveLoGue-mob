library event;

import 'package:event/page/event_detail.dart';
import 'package:flutter/material.dart';
import 'package:travelogue/main.dart';
import 'package:travelogue/widgets/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:event/page/add_event.dart';
import 'package:event/page/event_music.dart';
import 'package:event/util/fetch.dart';
import 'package:provider/provider.dart';
import 'package:event/event.dart';

import 'dart:convert' as convert;

class OthersEventHomePage extends StatefulWidget {
  static const ROUTE_NAME = "/others-event";
  const OthersEventHomePage({super.key});

  @override
  State<OthersEventHomePage> createState() => _OthersEventHomePageState();
}

class _OthersEventHomePageState extends State<OthersEventHomePage> {
  var userLoggedIn = LoggedIn.userLoggedIn;
  Color buttonColor = Color.fromRGBO(254, 185, 0, 100);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      floatingActionButton: 
      Visibility(
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddEventPage()));
          },
          label: const Text('Add Event'),
          icon: const Icon(Icons.add),
          backgroundColor: Color.fromRGBO(254, 185, 0, 100),
          foregroundColor: Colors.white,
        ),
        visible: userLoggedIn['status'] == 'L' ? true : false,
      ),
      appBar: AppBar(
        title: const Text(
          'Upcoming Events',
          style: TextStyle(),
        ),
      ),
      body: 
      ListView( 
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
                        Container (
                          alignment: Alignment.center,
                          height: 250,
                          width: double.infinity,
                          // color: Colors.black.withOpacity(0.2),
                          child:
                            Image.asset(
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
                              'Others',
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255)),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                                // width: double.infinity,
                                // height: 110,
                              ),
                              Text(
                                'Enjoy your trip to Indonesia by visiting local events. Find the upcoming events here',
                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 251, 208, 67)),
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
        FutureBuilder(
              future: fetchOthers(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.0),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Color.fromRGBO(38, 70, 85, 1),
                    )),
                  );
                } else {
                  if (snapshot.data.length == 0) {
                    return Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 30.0),
                          child: Center(
                            child: Text(
                              "Belum ada event ditambahkan",
                              style: TextStyle(
                                  color: Color.fromRGBO(38, 70, 85, 1),
                                  fontSize: 20,
                                  fontFamily: 'Aubrey'),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return 
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => 
                        Container(
                              margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
                              // margin: const EdgeInsets.symmetric(
                              //       horizontal: 12, vertical: 6),
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
                                child: ListTile(
                                  // onTap: () {},
                                  title: Text(
                                    "${snapshot.data![index].fields.title}",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "${snapshot.data![index].fields.place}",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  trailing: Text(
                                    "Read More ->",
                                    style: const TextStyle(color: Color.fromRGBO(254, 185, 0, 100)),
                                  ),
                                  onTap: () {
                                    // Route ke detail film
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EventDetail(
                                            title: snapshot.data![index].fields.title,
                                            description: snapshot.data![index].fields.description,
                                            date: snapshot.data![index].fields.date,
                                            place: snapshot.data![index].fields.place,
                                            category: snapshot.data![index].fields.category,
                                          )),
                                    );
                                  }
                                  // trailing: IconButton(
                                  //   onPressed: () async {
                                  //     var data = convert.jsonEncode(
                                  //       <String, String?>{
                                  //         'name':
                                  //             "${snapshot.data![index].name}",
                                  //         'description':
                                  //             "${snapshot.data![index].description}",
                                  //         'linkWebsite':
                                  //             "${snapshot.data![index].linkWebsite}",
                                  //       },
                                  //     );

                                  //     final response = await request
                                  //         .postJson(
                                  //             "https://trave-lo-gue.up.railway.app/local-shops/delete-flutter",
                                  //             data);
                                  //     Navigator.pushReplacementNamed(
                                  //                 context,
                                  //                 UMKMHomePage.ROUTE_NAME);
                                          
                                              
                                  //   },
                                  //   icon: Icon(Icons.delete),
                                  //   color: buttonColor,
                                  // ),
                                ),
                            )
                      );
                  }
                }
              })
      ],),
    );
  }
}