// ignore_for_file: constant_identifier_names, use_build_context_synchronously

import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:travelogue/home/login.dart';
import 'package:umkm/screens/umkm_home.dart';

class AddUMKMPage extends StatefulWidget {
  const AddUMKMPage({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/register';

  @override
  State<AddUMKMPage> createState() => _AddUMKMPageState();
}

class _AddUMKMPageState extends State<AddUMKMPage> {
  final _formKey = GlobalKey<FormState>();
  Color buttonColor = Color.fromRGBO(254, 185, 0, 100);

  String name = "";
  String description = "";
  String link_website = "";

  String statusMessage = "";

  void _initCreate(request) async {
    var data = convert.jsonEncode(
      <String, String?>{
        'name': name,
        'description': description,
        'link_website': link_website,
      },
    );

    final response = await request.postJson(
        "https://trave-lo-gue.up.railway.app/local-shops/add-flutter", data);

    if (response['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Recommendation has been added!"),
      ));
      Navigator.pushReplacementNamed(context, UMKMHomePage.ROUTE_NAME);
    } else if (response['status'] == 'dup') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Recommendation already exists!"),
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
                            context, UMKMHomePage.ROUTE_NAME);
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
                  "Add New Recommendation",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color.fromARGB(178, 3, 3, 3)),
                ),
                Form(
                  key: _formKey,
                  child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Name",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            name = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            name = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill out this field.";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Description",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            description = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            description = value!;
                          });
                        },
                        // Validator sebagai validasi form
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill out this field.";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Website Link ",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            link_website = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            link_website = value!;
                          });
                        },
                        // Validator sebagai validasi form
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
                    Text(statusMessage),
                    SizedBox(
                      height: 5,
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
