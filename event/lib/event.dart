library event;

<<<<<<< HEAD
import 'package:event/page/event_detail.dart';
=======
>>>>>>> c1f32fa7850e8335dbffe016361eb1b779d69d7d
import 'package:flutter/material.dart';
import 'package:travelogue/main.dart';
import 'package:travelogue/widgets/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:event/page/add_event.dart';
<<<<<<< HEAD
import 'package:event/page/user_event.dart';
import 'package:event/page/music_event.dart';
import 'package:event/page/festival_event.dart';
import 'package:event/page/culinary_event.dart';
import 'package:event/page/culture_event.dart';
import 'package:event/page/sport_event.dart';
import 'package:event/page/others_event.dart';
=======
>>>>>>> c1f32fa7850e8335dbffe016361eb1b779d69d7d
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
<<<<<<< HEAD
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
      // FloatingActionButton.extended(
      //   onPressed: () {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: (context) => const AddFeedbackPage()));
      //   },
      //   label: const Text('Add Feedback'),
      //   icon: const Icon(Icons.add),
      //   backgroundColor: Colors.blue,
      //   foregroundColor: Colors.white,
      // ),
      
      // floatingActionButton: 
      // Visibility(
      //   child: ElevatedButton(
      //       onPressed: () {
      //         Navigator.pushReplacementNamed(context, UserEventHomePage.ROUTE_NAME);
      //       },
      //       child: Icon(Icons.add)),
      //   visible: userLoggedIn['status'] == 'L' ? true : false,
      // ),
=======
      floatingActionButton: Visibility(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AddEventPage.ROUTE_NAME);
            },
            child: Icon(Icons.add)),
        visible: userLoggedIn['status'] == 'L' ? true : false,
      ),
>>>>>>> c1f32fa7850e8335dbffe016361eb1b779d69d7d
      appBar: AppBar(
        title: const Text(
          'Upcoming Events',
          style: TextStyle(),
        ),
      ),
      drawer: ScfDrawer(),
<<<<<<< HEAD
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
                              'Upcoming Local Events',
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
        Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const SizedBox(height: 48),

                    // Visibility
                    // Container(
                    //   child: 
                    //   Visibility(),
                    // ),
                    Container(
                      child: 
                      ListTile(
                        title: const Text(
                          'Event Category',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        trailing: 
                        Visibility(
                          child: GestureDetector(
                            onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const UserEventHomePage()));
                          },
                          // label: const Text('Add Feedback'),
                          // icon: const Icon(Icons.add),
                          
                          child: 
                          Container(
                            // padding: const EdgeInsets.symmetric(
                            //   vertical: 50,
                            // ),
                            // padding: ,
                            alignment: Alignment.center,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // borderRadius: BorderRadius.circular(24),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Color.fromRGBO(254, 185, 0, 100),
                              
                            ),
                            // color: buttonColor,
                            width: 85,
                            child: Text(
                              'My Event',
                                style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ),
                          visible: userLoggedIn['status'] == 'L' ? true : false,
                          // onTap: () {
                          //   Navigator.push(context,
                          //       MaterialPageRoute(builder: (context) => const UserEventHomePage()));
                          // },
                          // // label: const Text('Add Feedback'),
                          // // icon: const Icon(Icons.add),
                          
                          // child: 
                          // Container(
                          //   // padding: const EdgeInsets.symmetric(
                          //   //   vertical: 50,
                          //   // ),
                          //   // padding: ,
                          //   alignment: Alignment.center,
                          //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   // borderRadius: BorderRadius.circular(24),
                          //   decoration: const BoxDecoration(
                          //     borderRadius: BorderRadius.all(Radius.circular(10)),
                          //     color: Color.fromRGBO(254, 185, 0, 100),
                              
                          //   ),
                          //   // color: buttonColor,
                          //   width: 85,
                          //   child: Text(
                          //     'My Event',
                          //       style: TextStyle(
                          //       fontSize: 15,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                          // ),
                          // backgroundColor: Colors.blue,
                          // foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                    // const Text(
                    //   'Event Category',
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                        // onTap: onTap,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MusicEventHomePage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 36,
                            ),
                            width: 100,
                            // decoration: BoxDecoration(
                            //   color: Colors.white,
                            //   borderRadius: BorderRadius.circular(24),
                            // ),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.asset("assets/images/music.jpg"),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Music',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                
                              ],
                            ),
                            
                          ),
                        ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CulinaryEventHomePage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 36,
                            ),
                            width: 100,
                            // decoration: BoxDecoration(
                            //   color: Colors.white,
                            //   borderRadius: BorderRadius.circular(24),
                            // ),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.asset("assets/images/culinary.jpeg"),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Culinary',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                            ],
                            ),
                          ),
                        ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FestivalEventHomePage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            width: 100,
                            // decoration: BoxDecoration(
                            //   color: Colors.white,
                            //   borderRadius: BorderRadius.circular(24),
                            // ),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.asset("assets/images/festival.jpeg"),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Festival',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                            ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SportEventHomePage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 36,
                            ),
                            width: 100,
                            // decoration: BoxDecoration(
                            //   color: Colors.white,
                            //   borderRadius: BorderRadius.circular(24),
                            // ),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.asset("assets/images/sport.jpeg"),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Sport',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                            ],
                            ),
                          ),
                        ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CultureEventHomePage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 36,
                            ),
                            width: 100,
                            // decoration: BoxDecoration(
                            //   color: Colors.white,
                            //   borderRadius: BorderRadius.circular(24),
                            // ),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.asset("assets/images/culture.jpeg"),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Culture',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                            ],
                            ),
                          ),
                        ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OthersEventHomePage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            width: 100,
                            // decoration: BoxDecoration(
                            //   color: Colors.white,
                            //   borderRadius: BorderRadius.circular(24),
                            // ),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.asset("assets/images/others.jpg"),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Others',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                            ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'All Event',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                // ),
              // ),
            // ],
          ),
        ),
        FutureBuilder(
              future: fetchEvent(),
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
=======
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
>>>>>>> c1f32fa7850e8335dbffe016361eb1b779d69d7d
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
<<<<<<< HEAD
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
=======
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
>>>>>>> c1f32fa7850e8335dbffe016361eb1b779d69d7d
