import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:forum/model/question.dart';

import 'package:forum/util/delete.dart';
import 'package:forum/util/fetch.dart';

import 'package:forum/page/forum.dart';
import 'package:forum/page/add_answer.dart';

import 'package:travelogue/widgets/drawer.dart';
import 'package:travelogue/main.dart';

import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';


class AnswersPage extends StatefulWidget {

    const AnswersPage({super.key, required this.modelQuestion});
    final Question modelQuestion;

    @override
    State<AnswersPage> createState() => _DetailPageState(modelQuestion);
}

class _DetailPageState extends State<AnswersPage> {

    var userLoggedIn = LoggedIn.userLoggedIn;

    Question model;
    _DetailPageState(this.model);

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();

        return Scaffold(
            floatingActionButton: Visibility(
                visible: userLoggedIn['status'] == 'L' ? true : false,
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
                    child: const Icon(Icons.add)
                  ),
            ),
            appBar: AppBar(
                title: const Text('Question'),
                leading: IconButton(
                    onPressed: () {Navigator.pushReplacementNamed(context, ForumHomePage.ROUTE_NAME);},
                    icon: const Icon(Icons.arrow_back_ios_new),
                ),
            ),
            body: FutureBuilder(
                future: fetchAnswer(model.pk.toString()),
                builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                    }
                    else {
                        if (!snapshot.hasData) {
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
                                                const SizedBox(height: 12),
                                                Text(
                                                    "${snapshot.data![index].fields.username}",
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Color(0xFF757575)
                                                    )
                                                ),
                                                Text(
                                                    DateFormat.yMMMd().format(snapshot.data![index].fields.date),
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Color(0xFF757575)
                                                    )
                                                ),
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.center, 
                                                    children: [
                                                        Visibility(
                                                            visible: LoggedIn.user_data['username'] == snapshot.data![index].fields.username ? true : false,
                                                            child: IconButton(
                                                                onPressed: (() {
                                                                    deleteAnswer(request, snapshot.data![index]);
                                                                    Navigator.pushReplacementNamed(context, ForumHomePage.ROUTE_NAME);
                                                                }), 
                                                                icon: const Icon(Icons.delete),
                                                                color: const Color.fromRGBO(254, 185, 0, 100)
                                                            )
                                                        )
                                                    ]
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