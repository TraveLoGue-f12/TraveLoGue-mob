import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:travelogue/home/login.dart';
import 'package:forum/forum.dart';
import 'package:forum/model/question.dart';


class AddAnswerPage extends StatefulWidget {
    const AddAnswerPage({Key? key, required this.question}) : super(key: key);
    static const ROUTE_NAME = '/add_answer';
    final Question question;

    @override
    State<AddAnswerPage> createState() => _AddAnswerPageState(question);
}

class _AddAnswerPageState extends State<AddAnswerPage> {
    final _formKey = GlobalKey<FormState>();
    Question model;
    _AddAnswerPageState(this.model);
    Color buttonColor = Color.fromRGBO(254, 185, 0, 100);

    int question = 0;
    String answer = "";

    String statusMessage = "";


    void _initCreate(request) async {
        var data = convert.jsonEncode(
            <String, String?>{
                'question': question.toString(),
                'answer': answer, 
            },
        );

        final response = await request.postJson(
            "https://trave-lo-gue.up.railway.app/forum/add_answer_flutter/", data
        );

        if (response['status'] == 'success') {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Answer has been added!"),
                )
            );
            Navigator.pushReplacementNamed(context, ForumHomePage.ROUTE_NAME);
        }
        else if (response['status'] == 'dup') {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Question already exists!"),
                )
            );
        }
        else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("An error occured, please try again."),
                )
            );
        }
    }

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        Size size = MediaQuery.of(context).size;

        return Scaffold(
            body: Center(
                child: SingleChildScrollView(
                    child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                        child: IconButton(
                                            onPressed: () {
                                                Navigator.pushReplacementNamed(
                                                    context, ForumHomePage.ROUTE_NAME
                                                );
                                            },
                                            icon: Icon(Icons.keyboard_arrow_left_sharp),
                                            iconSize: 36,
                                        ),
                                    ),
                                ),
                                Image.asset(
                                    "assets/images/logo.png",
                                    height: 70,
                                    width: 70,
                                ),
                                SizedBox(
                                    height: 20,
                                ),
                                Text(
                                    "Add New Answer",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Color.fromARGB(178, 3, 3, 3)
                                    )
                                ),
                                Form(
                                    key: _formKey,
                                    child: Column(
                                        children: [
                                            SizedBox(
                                                height: 20,
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                    decoration: InputDecoration(
                                                        labelText: "Answer",
                                                        contentPadding: EdgeInsets.symmetric(
                                                            vertical: 12, horizontal: 12
                                                        ),
                                                        border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(16.0),
                                                        )
                                                    ),
                                                    onChanged: (String? value) {
                                                        setState(() {
                                                            answer = value!;
                                                            question = model.pk;
                                                        });
                                                    },
                                                    validator: (String? value) {
                                                        if (value == null || value.isEmpty) {
                                                            return "Please fill out this field.";
                                                        }
                                                        return null;
                                                    },
                                                ),
                                            ),
                                            SizedBox(
                                                height: 20,
                                            ),
                                            Container(
                                                padding: const EdgeInsets.all(8.0),
                                                width: double.infinity,
                                                child: ElevatedButton(
                                                    child: const Text(
                                                        "Add",
                                                        style: TextStyle(
                                                            color: Colors.white
                                                        ),
                                                    ),
                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(14)
                                                            ),
                                                        ),
                                                        backgroundColor: MaterialStateProperty.all(
                                                            buttonColor
                                                        ),
                                                    ),
                                                    onPressed: () {
                                                        print(model.pk.toString());
                                                        if (_formKey.currentState!.validate()) {
                                                            _initCreate(request);
                                                        }
                                                    },
                                                ),
                                            ),
                                            Text(
                                                statusMessage
                                            ),
                                            SizedBox(
                                                height: 5
                                            ),
                                        ],
                                    ),
                                )
                            ]
                        )
                    )
                )
            )
        );
    }
}