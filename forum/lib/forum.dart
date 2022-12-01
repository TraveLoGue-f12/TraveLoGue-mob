library forum;

import 'package:flutter/material.dart';
import 'package:forum/util/fetch.dart';

class ForumHomePage extends StatefulWidget {
    const ForumHomePage({super.key});

    @override
    State<ForumHomePage> createState() => _ForumHomePageState();
}

class _ForumHomePageState extends State<ForumHomePage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Travel Forum'),
            ),
            body: FutureBuilder(
                future: fetchQuestion(),
                builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                    }
                    else {
                        if (!snapshot.hasData) {
                            return Column(
                                children: const [
                                    Text(
                                        "There is no question yet...",
                                        style: TextStyle(
                                            color: Color(0xff59A5D8),
                                            fontSize: 20,
                                        )
                                    ),
                                    SizedBox(height: 8),
                                ],
                            );
                        }
                        else {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, index) => InkWell(
                                    child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 16, 
                                            vertical: 12
                                        ),
                                        padding: const EdgeInsets.all(20.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15.0),
                                            boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.black, blurRadius: 2.0
                                                )
                                            ]
                                        ),
                                        child: Row(
                                            children: [
                                                Text(
                                                    "${snapshot.data![index].fields.question}",
                                                ),
                                            ]
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