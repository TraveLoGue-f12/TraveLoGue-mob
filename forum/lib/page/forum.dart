import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:forum/util/fetch.dart';
import 'package:forum/util/delete.dart';

import 'package:forum/page/answers.dart';
import 'package:forum/page/add_question.dart';

import 'package:travelogue/main.dart';
import 'package:travelogue/widgets/drawer.dart';

import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';


class ForumHomePage extends StatefulWidget {
    static const ROUTE_NAME = "/forum_home";
    const ForumHomePage({super.key});

    @override
    State<ForumHomePage> createState() => _ForumHomePageState();
}

class _ForumHomePageState extends State<ForumHomePage> {
    var userLoggedIn = LoggedIn.userLoggedIn;

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();

        return Scaffold(
            appBar: AppBar(
                title: const Text('Travel Forum'),
            ),
            drawer: ScfDrawer(),
            floatingActionButton: Visibility(
                visible: userLoggedIn['status'] == 'T' ? true : false,
                child: ElevatedButton(
                    onPressed: () {
                        Navigator.pushReplacementNamed(context, AddQuestionPage.ROUTE_NAME);
                    },
                    child: Icon(Icons.add)),
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
                            return Column (
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                    Expanded(
                                        child: ListView.builder(
                                            itemCount: snapshot.data!.length,
                                            itemBuilder: (_, index) => InkWell(
                                                onTap: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => AnswersPage(
                                                            modelQuestion: snapshot.data![index]
                                                        )
                                                    )
                                                ),
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
                                                                "${snapshot.data![index].fields.title}",
                                                                style: const TextStyle(
                                                                    fontWeight: FontWeight.bold
                                                                )
                                                            ),
                                                            Text(
                                                                "${snapshot.data![index].fields.question}",
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
                                                                                deleteQuestion(request, snapshot.data![index]);
                                                                                Navigator.pushReplacementNamed(context, ForumHomePage.ROUTE_NAME);
                                                                            }), 
                                                                            icon: const Icon(Icons.delete),
                                                                            color: const Color.fromRGBO(254, 185, 0, 100)
                                                                        )
                                                                    )
                                                                ],
                                                            )
                                                        ]
                                                    ),
                                                ),
                                                
                                            )
                                        )
                                    )
                                ]
                            );
                        }
                    }
                }
            ),
        );
    }
}