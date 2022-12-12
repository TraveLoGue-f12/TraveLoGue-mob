library AttractionsPage;

import 'package:flutter/material.dart';

import 'package:travelogue/main.dart';
import 'package:travelogue/widgets/drawer.dart';
import 'package:attractions/util/fetch.dart';
import 'package:attractions/model/attractions_model.dart';
import 'package:attractions/page/detail_attr.dart';

import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'dart:convert' as convert;

class AttractionsPage extends StatefulWidget {
  const AttractionsPage({super.key});

  @override
  State<AttractionsPage> createState() => _AttractionsPageState();
}

class _AttractionsPageState extends State<AttractionsPage> {
  var loginStatus = LoggedIn.userLoggedIn;
  Color buttonColor = Color.fromRGBO(254, 185, 0, 100);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      floatingActionButton: Visibility(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/add-attraction");
            },
            child: Icon(Icons.add)),
        visible: loginStatus['status'] == 'L' ? true : false,
      ),
      appBar: AppBar(
        title: const Text(
          "Recommended Attractions",
          style: TextStyle(),
        ),
      ),
      drawer: ScfDrawer(),
      body: FutureBuilder(
        future: fetchObjekWisata(),
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
                                    color: Color.fromARGB(255, 180, 167, 167),
                                    blurRadius: 1.0)
                              ]),
                          child: ListTile(
                              onTap: () {},
                              title: Text(
                                "${snapshot.data![index].fields.title}",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              subtitle: Text(
                                "${snapshot.data![index].fields.location}",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              trailing: GestureDetector(
                                onTap: () {},
                                child: IconButton(
                                  icon:
                                      Icon(Icons.keyboard_arrow_right_rounded),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailAttractionsPage(
                                                    attraction: snapshot
                                                        .data![index])));
                                  },
                                ),
                              ))),
                    ),
                  )
                ],
              );
            }
          }
        },
      ),
    );
  }
}
