import 'dart:convert' as convert;

import 'package:flutter/material.dart';

import 'package:forum/page/forum.dart';
import 'package:forum/model/question.dart';

import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';


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
                                Image.asset(
                                    "assets/images/logo.png",
                                    height: 70,
                                    width: 70,
                                ),
                                const SizedBox(
                                    height: 20,
                                ),
                                Text(
                                    "Add New Answer",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Color.fromARGB(178, 3, 3, 3)
                                    )
                                ),
                                Form(
                                    key: _formKey,
                                    child: Column(
                                        children: [
                                            const SizedBox(
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
                                            const SizedBox(
                                                height: 20,
                                            ),
                                            Container(
                                                padding: const EdgeInsets.all(8.0),
                                                width: double.infinity,
                                                child: ElevatedButton(
                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all(
                                                            RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(14)
                                                            ),
                                                        ),
                                                        backgroundColor: MaterialStateProperty.all(
                                                            const Color.fromRGBO(254, 185, 0, 100)
                                                        ),
                                                    ),
                                                    onPressed: () {
                                                        if (_formKey.currentState!.validate()) {
                                                            _initCreate(request);
                                                        }
                                                    },
                                                    child: const Text(
                                                        "Add",
                                                        style: TextStyle(
                                                            color: Colors.white
                                                        ),
                                                    ),
                                                ),
                                            ),
                                            const SizedBox(
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