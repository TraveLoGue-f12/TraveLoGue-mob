import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:travelogue/home/login.dart';
import 'package:event/event.dart';
import 'package:intl/intl.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/add-event';

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateinput = TextEditingController();
  Color buttonColor = Color.fromRGBO(254, 185, 0, 100);

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  String _title = "";
  String _date = "";
  String _place = "";
  String _description = "";
  String _category = "Music";
  List<String> category = [
    "Music",
    "Culinary",
    "Festival",
    "Sport",
    "Culture",
    "Others"
  ];

  void _initCreate(request) async {
    var data = convert.jsonEncode(
      <String, String?>{
        'title': _title,
        'description': _description,
        'place': _place,
        'category': _category,
        'date': _date
      },
    );

    final response = await request.postJson(
            "https://trave-lo-gue.up.railway.app/event/add-flutter", data
        );

    if (response['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text("Event has been added!"),
            )
        );
        Navigator.pushReplacementNamed(context, EventHomePage.ROUTE_NAME);
    }
    else if (response['status'] == 'dup') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text("Event already exists!"),
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
    // final response = await request.postJson(
    //     "https://trave-lo-gue.up.railway.app/event/add-flutter", data);

    // if (response['status'] == 'success') {
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     content: Text("Recommendation has been added!"),
    //   ));
    //   Navigator.pushReplacementNamed(context, EventHomePage.ROUTE_NAME);
    // } else if (response['status'] == 'dup') {
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     content: Text("Recommendation already exists!"),
    //   ));
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     content: Text("An error occured, please try again."),
    //   ));
    // }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event'),
      ),
      body: Form(
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
                      labelText: "Event Title",
                      // Menambahkan icon agar lebih intuitif
                      // icon: const Icon(Icons.people),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Event Title tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ), // buat padding 1
                DropdownButton(
                  value: _category,
                  hint: const Text("Choose event category"),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: category.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
                Padding(
                    padding: EdgeInsets.all(15),
                    child: Center(
                        child: TextField(
                      controller:
                          dateinput, //editing controller of this TextField
                      decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Enter Date" //label text of field
                          ),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            dateinput.text =
                                formattedDate; //set output date to TextField value.
                                _date = dateinput.text;
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    )
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Place",
                      // Menambahkan icon agar lebih intuitif
                      // icon: const Icon(Icons.people),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _place = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _place = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Place tidak boleh kosong!';
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
                      // Menambahkan icon agar lebih intuitif
                      // icon: const Icon(Icons.people),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _description = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _description = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Description tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
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
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14))),
                      backgroundColor: MaterialStateProperty.all(buttonColor),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _initCreate(request);
                      }
                    },
                  ),
                ),
                // TextButton(
                //     child: const Text(
                //     "Simpan",
                //     style: TextStyle(color: Colors.white),
                //     ),
                //     style: ButtonStyle(
                //         backgroundColor: MaterialStateProperty.all(Colors.blue),
                //     ),
                //     onPressed: () {
                //         if (_formKey.currentState!.validate()) {
                //             Data data = Data(_judul.toString(), _nominal.toString(), _jenis.toString());
                //             listData.add(data);
                //             showDialog(
                //                 context: context,
                //                 builder: (context) {
                //                     return Dialog(
                //                         shape: RoundedRectangleBorder(
                //                         borderRadius: BorderRadius.circular(10),
                //                         ),
                //                         elevation: 15,
                //                         child: Container(
                //                             child: ListView(
                //                                 padding: const EdgeInsets.only(top: 20, bottom: 20),
                //                                 shrinkWrap: true,
                //                                 children: <Widget>[
                //                                     const Padding(
                //                                         padding: EdgeInsets.all(10),
                //                                         child: Center(
                //                                         child: Text("Data telah tersimpan."),
                //                                         ),
                //                                     ),
                //                                     Padding(
                //                                         padding: const EdgeInsets.all(10),
                //                                         child: TextButton(
                //                                         onPressed: () {
                //                                             Navigator.pop(context);
                //                                         },
                //                                         child: const Text('Kembali'),
                //                                         ),
                //                                     ),
                //                                 ],
                //                             ),
                //                         ),
                //                     );
                //                 },
                //             );
                //         }
                //     },
                // ),
              ], // tutup
            ),
          ),
        ),
      ),
    );
  }
}
