import 'package:flutter/material.dart';
import 'package:travelogue/main.dart';
import '../util/fetch.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, 
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Home"),
          ElevatedButton(
              onPressed: () {
                
                getData(getCred());
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
