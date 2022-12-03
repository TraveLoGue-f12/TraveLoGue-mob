import 'package:flutter/material.dart';
import 'package:forum/util/fetch.dart';
import 'package:forum/page/detail.dart';
import 'package:forum/model/question.dart';
import 'package:forum/forum.dart';
import 'package:forum/page/add_answer.dart';
import 'package:intl/intl.dart';
import 'package:travelogue/widgets/drawer.dart';
import 'package:travelogue/main.dart';

class DetailPage extends StatefulWidget {
    const DetailPage({super.key, required this.modelQuestion});
    final Question modelQuestion;

    @override
    State<DetailPage> createState() => _DetailPageState(modelQuestion);
}

class _DetailPageState extends State<DetailPage> {
    var userLoggedIn = LoggedIn.userLoggedIn;

    Question model;
    _DetailPageState(this.model);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            floatingActionButton: Visibility(
                child: ElevatedButton(
                    onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddAnswerPage(
                                    question: model
                                )
                            )
                        );
                    },
                    child: Icon(Icons.add)),
                visible: userLoggedIn['status'] == 'L' ? true : false,
            ),
            appBar: AppBar(
                title: const Text('Question'),
            ),
            drawer: ScfDrawer(),
            body: FutureBuilder(
                future: fetchAnswer(model.pk.toString()),
                builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                    }
                    else {
                        if (model.fields.isAnswered == false) {
                            return Column(
                                children: const [
                                    SizedBox(height: 50),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                            "There is no answer yet...",
                                            style: TextStyle(
                                                fontSize: 18,
                                            )
                                        )
                                    )
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
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                Text(
                                                    "${snapshot.data![index].fields.answer}",
                                                ),
                                                SizedBox(height: 12),
                                                Text(
                                                    "${snapshot.data![index].fields.username}",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Color(0xFF757575)
                                                    )
                                                ),
                                                Text(
                                                    DateFormat.yMMMd().format(snapshot.data![index].fields.date),
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Color(0xFF757575)
                                                    )
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