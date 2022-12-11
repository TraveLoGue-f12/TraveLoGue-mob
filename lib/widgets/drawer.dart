import 'package:flutter/material.dart';
import '../main.dart';
import '../home/home.dart';
import '../home/login.dart';
import 'package:umkm/screens/umkm_home.dart';
import 'package:forum/page/forum.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ScfDrawer extends StatefulWidget {
  const ScfDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<ScfDrawer> createState() => _ScfDrawerState();
}

class _ScfDrawerState extends State<ScfDrawer> {
  Color buttonColor = Color.fromRGBO(254, 185, 0, 100);
  bool isActive = false;
  String? route = null;
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return SafeArea(
      child: Theme(
        data: Theme.of(context).copyWith(
                 canvasColor: Color.fromARGB(255, 0, 0, 0), //This will change the drawer background to blue.
                 //other styles
              ),
        child: Drawer(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("TraveLoGue", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 26),),
                  Text(".", style: TextStyle(color: buttonColor, fontSize: 26, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26.0, bottom: 10),
                child: Text(
                  "Hello, ${LoggedIn.user_data['username']}!",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pushReplacementNamed(context,"/login");
                },
                child: Container(padding: EdgeInsets.only(top: 2),child: Text("LOGOUT", style: TextStyle(color: Colors.white),)),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Color.fromARGB(255, 32, 29, 29),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                    
                    
                  ),
                  side: BorderSide(width:2, color:buttonColor)
                ),
              ),
              SizedBox(height: 10,),
              Divider(thickness: 2, color: buttonColor,),
              ListTile(
                title: const Text('HOME', style: TextStyle(color: Colors.white)),
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
                    hint: const Text(
                      "RECOMMENDATIONS",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 14),
                    ),
                    value: route,
                    items: const <DropdownMenuItem<String>>[
                      DropdownMenuItem<String>(
                        value: UMKMHomePage.ROUTE_NAME,
                        child: Text('LOCAL SHOPS', style: TextStyle(color: Colors.white)),
                      ),
                      DropdownMenuItem<String>(
                        value: 'L',
                        child: Text('ATTRACTIONS', style: TextStyle(color: Colors.white)),
                      ),
                      DropdownMenuItem<String>(
                        value: 'T',
                        child: Text('UPCOMING EVENTS', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        if (value != 'L' || value != 'T')
                          Navigator.pushReplacementNamed(context, value!);
                      });
                    },
                  ),
                ),
              ),
              ListTile(
                title: const Text('MY PLANNER', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/planner");
                },
              ),
              ListTile(
                title: const Text('QNA FORUM', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pushReplacementNamed(context, ForumHomePage.ROUTE_NAME);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}