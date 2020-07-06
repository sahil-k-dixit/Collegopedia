/// This file is about add the page interface
/// Customize the page
///

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';

var categories = ["OnCampus", "OffCampus"];

class AddYourExperience extends StatefulWidget {
  @override
  _AddYourExperienceState createState() => _AddYourExperienceState();
}

class _AddYourExperienceState extends State<AddYourExperience> {
  DatabaseReference itemRef;

  final _formKey = GlobalKey<FormState>();
  final dbRef = FirebaseDatabase.instance.reference().child("Placements");
  final name = TextEditingController();
  final company = TextEditingController();
  final experience = TextEditingController();
  String mode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final FirebaseDatabase database = FirebaseDatabase
        .instance; //Rather then just writing FirebaseDatabase(), get the instance.
    itemRef = database.reference().child('Placements');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add your Experience"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    maxLength: 30,
                    controller: name,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your name ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your name",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  maxLength: 30,
                  controller: company,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter company name ';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your company name",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: DropdownButtonFormField(
                  items: categories.map((String c) {
                    return DropdownMenuItem(
                      child: Text(c),
                      value: c,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      this.mode = value;
                    });
                  },
                  value: mode,
                  decoration: InputDecoration(
                    hintText: 'Please Select mode',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    minLines: 5,
                    maxLength: 500,
                    maxLines: 10,
                    controller: experience,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Experience ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your Experience',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: RaisedButton(
                    color: Colors.lightBlue,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        dbRef.child(company.text).push().set({
                          "name": name.text,
//                        "company": company.text.isEmpty ? null : company.text,
                          "description": experience.text,
                          "mode": mode,
                        });
                        name.clear();
                        company.clear();
                        experience.clear();

                        showAlertDialog(context);
                        Navigator.pushNamed(context, '/placements');
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
      Navigator.pop(context);
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Response",
      textAlign: TextAlign.center,
    ),
    content: Text("Thanks for your valuable time!"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}