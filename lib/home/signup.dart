// ignore_for_file: constant_identifier_names, use_build_context_synchronously

import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:travelogue/home/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/register';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  Color buttonColor = Color.fromRGBO(254, 185, 0, 100);

  String username = "";
  String full_name = "";
  String email = "";
  String password1 = "";
  String password2 = "";

  String? selectedValue = null;
  String statusMessage = "";

  void _initRegister(request) async {
    var data = convert.jsonEncode(
      <String, String?>{
        'username': username,
        'password1': password1,
        'password2': password2,
        'full_name': full_name,
        'email': email,
        'status': selectedValue
      },
    );

    print(data);

    final response = await request.postJson(
        "https://trave-lo-gue.up.railway.app/auth/register/", data);

    if (response['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Account has been successfully registered!"),
      ));
      Navigator.pushReplacementNamed(context, '/login');
    } else if (response['status'] == 'duplicate') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Username already exists!"),
      ));
    } else if (response['status'] == 'pass failed') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Password does not match!"),
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
                Image.asset(
                  "assets/images/logo.png",
                  height: 70,
                  width: 70,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Sign Up to TraveLoGue",
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 12),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16))),
                            hint: const Text("I am a ..."),
                            value: selectedValue,
                            validator: (value) =>
                                value == null ? "I am a ..." : null,
                            items: const <DropdownMenuItem<String>>[
                              DropdownMenuItem<String>(
                                value: 'T',
                                child: Text('Tourist'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'L',
                                child: Text('Local'),
                              ),
                            ],
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                          ), // <-- SEE HERE
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Full name",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            full_name = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            full_name = value!;
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
                          labelText: "Username ",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            username = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            username = value!;
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
                          labelText: "Email ",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            email = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            email = value!;
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
                      // Menggunakan padding sebesar 8 pixels
                      padding: const EdgeInsets.all(8.0),

                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password ",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            password1 = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            password1 = value!;
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
                      // Menggunakan padding sebesar 8 pixels
                      padding: const EdgeInsets.all(8.0),

                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password Confirmation",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        // Menambahkan behavior saat nama diketik
                        onChanged: (String? value) {
                          setState(() {
                            password2 = value!;
                          });
                        },
                        // Menambahkan behavior saat data disimpan
                        onSaved: (String? value) {
                          setState(() {
                            password2 = value!;
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
                          "Create Account",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14))),
                          backgroundColor:
                              MaterialStateProperty.all(buttonColor),
                        ),
                        // onPressed: () async {
                        //   final response = await request.post(
                        //       "https://reflekt-io.up.railway.app/registerflutter",
                        //       {
                        //         'username': username,
                        //         'password1': password1,
                        //         'password2': password2,
                        //         'email': email,

                        //       });
                        //   if (_formKey.currentState!.validate()) {
                        //     print("register berhasil");
                        //   }
                        // }
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _initRegister(request);
                          }
                        },
                      ),
                    ),
                    Text(statusMessage),
                    SizedBox(
                      height: 5,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/login");
                        },
                        child: Text(
                          "Already have an account? Log in",
                          style: TextStyle(color: buttonColor),
                        ))
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
