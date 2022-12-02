import 'package:flutter/material.dart';
import 'package:travelogue/main.dart';
import 'package:travelogue/widgets/drawer.dart';
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
      appBar: AppBar(title: Text("TEST")),
      drawer: ScfDrawer(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, 
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Home",),
          ElevatedButton(
              onPressed: () async {
                final userLoggedIn = await getData(getCred());
                print(userLoggedIn['status']);
              },
              child: Text("Get Data")),
          ElevatedButton(
              onPressed: () {
                
                Navigator.pushReplacementNamed(context, "/login");
              },
              child: Text("Back"))
        ]),
      ),
    );
  }
}
