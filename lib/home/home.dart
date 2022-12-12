import 'package:flutter/material.dart';
import 'package:forum/page/forum.dart';
import 'package:travelogue/main.dart';
import 'package:travelogue/widgets/drawer.dart';
import 'package:event/event.dart';
import 'package:umkm/screens/umkm_home.dart';
import 'package:forum/page/forum.dart';
import 'package:attractions/attractions.dart';
import 'package:planner/screens/planner.dart';
import '../util/fetch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const ROUTE_NAME = "/home";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
                  "Hello, ${LoggedIn.user_data['username']}!",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  )
              )),
      drawer: ScfDrawer(),
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
                          Container(
                          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
                          child:
                          Column(
                            // margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: 
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      const TextSpan(
                                          text: 'Welcome to TraveloGue',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Color.fromARGB(255, 255, 255, 255)),),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: 
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'TraveLoGue invites locals to participate in sharing the beauty and diversity of Indonesia. TraveLoGue provide a platform for foreign tourist to discover activities that can be done while visiting cities in Indonesia – from tourism objects that have unique historical values, to a variety of creative local shops.',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color.fromARGB(255, 251, 208, 67) )),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              ],
                            ),
                          ),
                          
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                            'Our Features',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      Container(
                        margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
                        child:
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                          // onTap: onTap,
                            // onTap: onTap,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UMKMHomePage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                children: [
                                  // Icon: Icon(Icons.delete),
                                  Image.asset("assets/images/local-shops.jpg"),
                                  // const SizedBox(height: 10),
                                  Text(
                                    "Local Shops",
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AttractionsPage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                children: [
                                  // Icon: Icon(Icons.delete),
                                  Image.asset("assets/images/local-attractions.jpg"),
                                  // const SizedBox(height: 10),
                                  Text(
                                    "Local Attractions",
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EventHomePage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                children: [
                                  // Icon: Icon(Icons.delete),
                                  Image.asset("assets/images/local-events.jpg"),
                                  // const SizedBox(height: 10),
                                  Text(
                                    "Local Events",
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      ),
                    Container(
                        margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
                        child:
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForumHomePage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                children: [
                                  // Icon: Icon(Icons.delete),
                                  Image.asset("assets/images/travel-forum.jpg"),
                                  // const SizedBox(height: 10),
                                  Text(
                                    "Travel Forum",
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PlannerPage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                children: [
                                  // Icon: Icon(Icons.delete),
                                  Image.asset("assets/images/travel-planner.jpg"),
                                  // const SizedBox(height: 10),
                                  Text(
                                    "Travel Planner",
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      )
                    ],
                  // ),
                // ),
              // ],
            ),
          ),
          
        ],
      ),
      // body: Center(
      //   child: Column(mainAxisAlignment: MainAxisAlignment.center, 
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Text("Home",),
      //     ElevatedButton(
      //         onPressed: () async {
      //           final userLoggedIn = await getData(getCred());
      //           print(userLoggedIn['status']);
      //         },
      //         child: Text("Get Data")),
      //     ElevatedButton(
      //         onPressed: () {
                
      //           Navigator.pushReplacementNamed(context, "/login");
      //         },
      //         child: Text("Back"))
      //   ]),
      // ),
    );
  }
}
