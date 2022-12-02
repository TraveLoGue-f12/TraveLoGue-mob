library umkm;

import 'package:flutter/material.dart';
import 'package:travelogue/main.dart';
import 'package:travelogue/widgets/drawer.dart';
import 'package:umkm/screens/add_umkm.dart';
import 'package:umkm/util/fetch.dart';

class UMKMHomePage extends StatefulWidget {
  static const ROUTE_NAME = "/umkm_home";
  const UMKMHomePage({super.key});

  @override
  State<UMKMHomePage> createState() => _UMKMHomePageState();
}

class _UMKMHomePageState extends State<UMKMHomePage> {
  var userLoggedIn = LoggedIn.userLoggedIn;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AddUMKMPage.ROUTE_NAME);
            },
            child: Icon(Icons.add)),
        visible: userLoggedIn['status'] == 'L' ? true : false,
      ),
      appBar: AppBar(
        title: const Text('Local Shops', style: TextStyle(),),
        
      ),
      drawer: ScfDrawer(),
      body: FutureBuilder(
          future: fetchUMKM(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(254, 185, 0, 100))));
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
                      child: GridView.builder(
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (_, index) => InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 6),
                                  padding: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(5.0),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 180, 167, 167),
                                            blurRadius: 1.0)
                                      ]),
                                  child: Text(
                                    "${snapshot.data![index].name}",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
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
