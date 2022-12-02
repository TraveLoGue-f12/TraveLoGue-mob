import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:travelogue/home/home.dart';
import 'package:travelogue/main.dart';
import 'package:travelogue/util/fetch.dart';
import 'package:travelogue/widgets/drawer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  

  final _loginFormKey = GlobalKey<FormState>();
  Color buttonColor = Color.fromRGBO(254, 185, 0, 100);

  String username = "";
  String password1 = "";
  String statusMessage = "";

  void _initLogin(request) async {
    
    final response =
        await request.login("https://trave-lo-gue.up.railway.app/auth/login/", {
      'username': username,
      'password': password1,
    }).then((value) {
      final newValue = new Map<String, dynamic>.from(value);
    
      setState(() {
        if (newValue['message'].toString() ==
            "Failed to Login, check your email/password.") {
          statusMessage = "Invalid username/password!";
        } else
          statusMessage = newValue['message'].toString();
      });
    });

    if (request.loggedIn) {
      
      LoggedIn.user_data['username'] = username;
      LoggedIn.user_data['password'] = password1;
      LoggedIn.userLoggedIn = await getData(getCred());
      
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Login success!"),
      ));
      Navigator.pushReplacementNamed(context, '/home');
      
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // The rest of your widgets are down below
    // 'username' and 'password' should be the values of the user login form.

    return Scaffold(
      resizeToAvoidBottomInset: false,
      
      
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 70,
                width: 70,
              ),
              Form(
                key: _loginFormKey,
                child: SingleChildScrollView(
                    child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "Login to TraveLoGue",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color.fromARGB(178, 3, 3, 3)),
                          ),
                        ),
                        SizedBox(
                          height: 30,
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
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          width: double.infinity,
                          child: ElevatedButton(
                              child: const Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14))),
                                backgroundColor:
                                    MaterialStateProperty.all(buttonColor),
                              ),
                              onPressed: () {
                                if (_loginFormKey.currentState!.validate()) {
                                  _initLogin(request);
                                }
                              }),
                        ),
                        Text(statusMessage),
                        SizedBox(height: 20,),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, "/signup");
                            },
                            child: Text("Don't have an account yet? Sign up", style: TextStyle(color: buttonColor),))
                      ]),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
