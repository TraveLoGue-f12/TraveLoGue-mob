import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:travelogue/home/login.dart';
import 'package:attractions/attractions.dart';

import 'dart:convert' as convert;

class AddAttractionsPage extends StatefulWidget {
  const AddAttractionsPage({Key? key}) : super(key: key);

  @override
  State<AddAttractionsPage> createState() => _AddAttractionsPageState();
}

class _AddAttractionsPageState extends State<AddAttractionsPage> {
  final _formKey = GlobalKey<FormState>();
  Color buttonColor = Color.fromRGBO(254, 185, 0, 100);

  String _title = "";
  String _description = "";
  String _location = "";
  String _url_location = "";

  void _initCreate(request) async {
    var data = convert.jsonEncode(
      <String, String?>{
        'title': _title,
        'description': _description,
        'location': _location,
        'url_location': _url_location,
      },
    );

    var response = await request.postJson(
        "https://trave-lo-gue.up.railway.app/attraction/add_flutter/", data);

    if (response['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Attraction has been added!"),
      ));
      Navigator.pushReplacementNamed(context, "/attractions");
    } else if (response['status'] == 'dup') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Attraction already exists!"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("An error occured, please try again."),
      ));
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
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/attractions");
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
                "Add New Attraction",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color.fromARGB(178, 3, 3, 3)),
              ),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Attraction name",
                                // icon: const Icon(Icons.people),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            onChanged: (String? value) {
                              setState(() {
                                _title = value!;
                              });
                            },
                            onSaved: (String? value) {
                              setState(() {
                                _title = value!;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Short description...",
                                // icon: const Icon(Icons.people),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            onChanged: (String? value) {
                              setState(() {
                                _description = value!;
                              });
                            },
                            onSaved: (String? value) {
                              setState(() {
                                _description = value!;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "Location, e.g Jakarta, Bali, etc",
                                // icon: const Icon(Icons.people),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            onChanged: (String? value) {
                              setState(() {
                                _location = value!;
                              });
                            },
                            onSaved: (String? value) {
                              setState(() {
                                _location = value!;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: "URL Google Maps",
                                // icon: const Icon(Icons.people),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )),
                            onChanged: (String? value) {
                              setState(() {
                                _url_location = value!;
                              });
                            },
                            onSaved: (String? value) {
                              setState(() {
                                _url_location = value!;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required!';
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
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14))),
                              backgroundColor:
                                  MaterialStateProperty.all(buttonColor),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _initCreate(request);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
