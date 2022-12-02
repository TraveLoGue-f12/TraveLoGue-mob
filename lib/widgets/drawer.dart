import 'package:flutter/material.dart';
import '../main.dart';
import '../home/home.dart';
import '../home/login.dart';
import 'package:umkm/screens/umkm_home.dart';

class ScfDrawer extends StatefulWidget {
  const ScfDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<ScfDrawer> createState() => _ScfDrawerState();
}

class _ScfDrawerState extends State<ScfDrawer> {
  bool isActive = false;
  String? route = null;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
         
            ListTile(
              title: const Text('HOME'),
              onTap: () {
                Navigator.pushReplacementNamed(context, HomePage.ROUTE_NAME);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Container(
                
                alignment: Alignment.topLeft,
                child: DropdownButton(
                  underline: SizedBox(),
                  isExpanded: true,
                  hint: const Text("RECOMMENDATIONS", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 14),),
                  value: route,
                  
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: UMKMHomePage.ROUTE_NAME,
                      child: Text('LOCAL SHOPS'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'L',
                      child: Text('ATTRACTIONS'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'T',
                      child: Text('UPCOMING EVENTS'),
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      
                      if(value != 'L' || value != 'T')
                      Navigator.pushReplacementNamed(context, value!);
                    });
                  },
                ),
              ),
            ),
            
            ListTile(
              title: const Text('MY PLANNER'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('QNA FORUM'),
              onTap: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
