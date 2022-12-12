import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'dart:convert' as convert;
import 'package:planner/screens/planner.dart';
import 'package:planner/models/plan.dart';

class EditPlanPage extends StatefulWidget {
  static const ROUTE_NAME = "/editplanner";
  const EditPlanPage({super.key, required this.plan});
  final Plan plan;

  @override
  State<EditPlanPage> createState() => _EditPlanPageState();
}

class _EditPlanPageState extends State<EditPlanPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textEditingController = TextEditingController();
  DateTimeRange? dateRange;
  String name = "";
  String tripDate = "";
  DateTime startDate = DateTime(0,0,0);
  DateTime endDate = DateTime(0,0,0);
  String notes = "";
  String image = "";

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.plan.fields.tripDate;
    name = widget.plan.fields.name;
    tripDate = widget.plan.fields.tripDate;
    startDate = widget.plan.fields.startDate;
    endDate = widget.plan.fields.endDate;
    notes = widget.plan.fields.notes;
  }
  void _initEdit(request) async {
    var data = convert.jsonEncode(
      <String, String?>{
        "pk": widget.plan.pk.toString(),
        "name": name,
        "trip_date": tripDate,
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "notes": notes,     
      },
    );

    final response = await request.postJson(
      "https://trave-lo-gue.up.railway.app/planner/editflutter/", data
    );

    if (response['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("New plan successfully added!"),
      ));
      Navigator.pushReplacementNamed(context, PlannerPage.ROUTE_NAME);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("An error occured, please try again."),
      ));
    }
  }

  Future pickDateRange(BuildContext context) async {
    _textEditingController.text = widget.plan.fields.tripDate;
    final initialDateRange = DateTimeRange(
      start: widget.plan.fields.startDate,
      end: widget.plan.fields.endDate,
    );

    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateRange ?? initialDateRange,
    );

    if (newDateRange != null) {
      dateRange = newDateRange;
      startDate = dateRange!.start;
      endDate = dateRange!.end;
      List<String> start = startDate.toString().substring(0,10).split("-");
      String formattedStart = "${start[2]}/${start[1]}/${start[0]}";
      List<String> end = endDate.toString().substring(0,10).split("-");
      String formattedEnd = "${end[2]}/${end[1]}/${end[0]}";
      tripDate = "$formattedStart - $formattedEnd";

      _textEditingController
        ..text = tripDate
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Plan"),
        leading: IconButton(
          onPressed: () {Navigator.pushReplacementNamed(context, PlannerPage.ROUTE_NAME);},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _initEdit(request);
              }
            }, 
            child: const Text('SAVE', style: TextStyle(color: Colors.black))
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 50, 24, 24),
            child: Column(children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Plan Title",
                    labelText: "What's the plan?",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                    ),
                ),
                initialValue: widget.plan.fields.name,
                // Menambahkan behavior saat nama diketik 
                onChanged: (String value) {
                    setState(() {
                        name = value;
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
                        return 'Plan title is required';
                    }
                    return null;
                },
              ),

              const SizedBox(height:30),
              
              TextFormField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.calendar_today),
                  labelText: "Select date",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onTap: () {
                  pickDateRange(context);
                },

              ),

              const SizedBox(height:30),

              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: "Notes",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                  ),
                ), 
                initialValue: widget.plan.fields.notes,
                onChanged: (String? value) {
                    setState(() {
                        notes = value!;
                    });
                },
                // Menambahkan behavior saat data disimpan
                onSaved: (String? value) {
                    setState(() {
                        notes = value!;
                    });
                },
              ),
            ])
          ),
        )
      ),
    );
  }
}