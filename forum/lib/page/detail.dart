import 'package:flutter/material.dart';
import 'package:forum/util/fetch.dart';
import 'package:forum/page/detail.dart';
import 'package:forum/model/question.dart';
import 'package:forum/forum.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
    const DetailPage({super.key, required this.modelQuestion});
    final Question modelQuestion;

    @override
    State<DetailPage> createState() => _DetailPageState(modelQuestion);
}

class _DetailPageState extends State<DetailPage> {
    Question model;
    _DetailPageState(this.model);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Question'),
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
                                    Text(
                                        "There is no answer yet...",
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