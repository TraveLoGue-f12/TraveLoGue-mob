
import 'package:flutter/material.dart';
import 'package:planner/util/fetch_plan.dart';

class PlannerPage extends StatefulWidget {
  const PlannerPage({super.key});

  @override
  State<PlannerPage> createState() => _PlannerPageState();
}

class _PlannerPageState extends State<PlannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Planner"),
      ),
      body: FutureBuilder(
        future: fetchPlans(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak ada watchlist",
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
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => WatchlistDetail(
                  //         watchlistItem: snapshot.data![index],
                  //       ),
                  //     )
                  //   );                    
                  // },
                  child: Container(                  
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      // border: Border.all(
                      //   width: 1.5,
                      //   color: snapshot.data![index].fields.watched
                      //     ? Colors.deepPurple.shade400
                      //     : Colors.grey.shade300
                      // ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 1.0
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          snapshot.data![index].fields.name,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                        ),
                        // Checkbox(
                        //   value: snapshot.data[index].fields.watched,
                        //   onChanged: (bool? newValue) {
                        //     setState(() {
                        //       snapshot.data![index].fields.watched = !snapshot.data![index].fields.watched;
                        //     });
                        //   },
                        // ),
                      ],
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