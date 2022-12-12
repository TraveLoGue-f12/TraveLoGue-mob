import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:planner/screens/add_plan.dart';
import 'package:planner/screens/edit_plan.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:planner/util/fetch.dart';
import 'package:planner/util/delete_plan.dart';
import 'package:travelogue/main.dart';
import 'package:travelogue/widgets/drawer.dart';

class PlannerPage extends StatefulWidget {
  static const ROUTE_NAME = "/planner";
  const PlannerPage({super.key});

  @override
  State<PlannerPage> createState() => _PlannerPageState();
}

class _PlannerPageState extends State<PlannerPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Planner"),        
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AddPlanPage.ROUTE_NAME);
            },
            icon: const Icon(Icons.add)
          )
        ]
      ),
      drawer: const ScfDrawer(), 
      body: FutureBuilder(
        future: fetch(LoggedIn.user_data['username']!),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "No plans yet...",
                    style:
                        TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (_, index) => GestureDetector(
                  onTap:() {
                    Navigator.push(context, MaterialPageRoute(
                      builder: ((context) => EditPlanPage(
                        plan: snapshot.data![index]
                      ))
                    ));
                  },
                  child: ClipPath(
                    clipper: const ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(64))
                      )
                    ),
                    child: Container(
                      height: 140.0,
                      margin: const EdgeInsets.all(12.0),
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(10, 0, 0, 0),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                          offset: Offset(-2, 2)
                        )
                      ]),
                      child: Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (((context) {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: ((context) => EditPlanPage(
                                    plan: snapshot.data![index]
                                  ))
                                ));
                              })),
                              backgroundColor: Colors.orange[700]!,
                              foregroundColor: Colors.white,
                              icon: Icons.edit
                            ),
                          ]
                        ), 
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              right: BorderSide.none,
                              top: BorderSide.none,
                              bottom: BorderSide.none,
                              left: BorderSide(
                                width: 10.0,
                                color: index % 3 == 1 ? const Color.fromARGB(255, 245, 187, 62)
                                  : index % 3 == 2 ? const Color.fromARGB(255, 97, 15, 127) 
                                  : const Color.fromARGB(255, 255, 90, 95)
                              )
                            ),
                          
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Expanded(child: Text(
                                    snapshot.data![index].fields.name,
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ))
                                ]),
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_today_sharp, size: 20, color: Colors.grey),
                                    const SizedBox(width: 10),
                                    Text(
                                      snapshot.data![index].fields.tripDate,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey,
                                      )
                                    )
                                  ]
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.notes_sharp, size: 20, color: Colors.grey),                                
                                    const SizedBox(width: 10),
                                    Expanded(child: Text(
                                      snapshot.data![index].fields.notes,
                                      maxLines: 1,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey,
                                      )
                                    ))
                                  ]
                                ),
                              ],
                            )
                          )
                        )
                      )
                    )
                  )
                )
              );
            }
          }
        }
      )
    );
  }
}
