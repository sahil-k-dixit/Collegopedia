/// This file is about add the page interface
/// Customize the page
///

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:collegopedia/globals.dart';

var categories = ["OnCampus", "OffCampus"];
var difficultyLevel = [
  '5- Very Difficult',
  '4- Difficult',
  '3- Medium',
  '2- Easy',
  '1- Very Easy'
];

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
  final batch = TextEditingController();
  final clg =TextEditingController();
  final branch = TextEditingController();
  final role = TextEditingController();
  //final expectations = TextEditingController();
  String apptitude;
  String personalInterview;
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
        title: Center(child: Text("Add Your Experience",style: appBarHeaderTextStyle,)),
      ),
     // backgroundColor: Color(0xFF1D1F2D),
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
                      hintStyle: hintTextStyle,
                      hintText: "Enter your name",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )), // Name
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
                      hintStyle: hintTextStyle,
                      hintText: "Enter your company name",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: DropdownButtonFormField(
                  style: hintTextStyle.copyWith(
                      color: Colors.white
                  ),
                  //iconDisabledColor: Colors.black,

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
                    hintStyle: hintTextStyle,
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
                    maxLength: 4,
                    controller: batch,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your batch ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintStyle: hintTextStyle,
                      hintText: "Enter your Batch/Graduation Year",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    maxLength: 50,
                    controller: clg,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your clg name ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintStyle: hintTextStyle,
                      hintText: "Enter your College name",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    maxLength: 30,
                    controller: branch,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your branch ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintStyle: hintTextStyle,
                      hintText: "Enter your branch",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    maxLength: 60,
                    controller: role,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter your role ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintStyle: hintTextStyle,
                      hintText: "For which role did you applied?",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(20),
                child: DropdownButtonFormField(
                  style: hintTextStyle.copyWith(
                    color: Colors.white
                  ),
                  items: difficultyLevel.map((String c) {
                    return DropdownMenuItem(
                      child: Text(c),
                      value: c,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      this.apptitude = value;
                    });
                  },
                  value: apptitude,
                  decoration: InputDecoration(
                    hintStyle: hintTextStyle,
                    hintText:
                        'Difficulty level(Apptitude or written coding test)',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: DropdownButtonFormField(
                  style: hintTextStyle.copyWith(
                      color: Colors.white
                  ),
                  items: difficultyLevel.map((String c) {
                    return DropdownMenuItem(

                      child: Text(c),
                      value: c,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      this.personalInterview = value;
                    });
                  },
                  value: personalInterview,
                  decoration: InputDecoration(
                    hintStyle: hintTextStyle,
                    hintText: 'Difficulty level of personal interview',
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
                    maxLength: 1500,
                    maxLines: 15,
                    controller: experience,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Experience ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintStyle: hintTextStyle,
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
                        dbRef.child(company.text).child(name.text)..set({
                          "name": name.text,
//                        "company": company.text.isEmpty ? null : company.text,
                          "description": experience.text,
                          "mode": mode,
                          "apptitude": apptitude,
                          "personal": personalInterview,
                          "batch": batch.text,
                          "role": role.text,
                          "branch":branch.text,
                          "clg":clg.text
                        }).then((_) => print('Added Successfully'));
                        name.clear();
                        company.clear();
                        experience.clear();
                        branch.clear();
                        clg.clear();
                        batch.clear();
                        role.clear();
                        showAlertDialog(context);
                        // Navigator.pushNamed(context, '/placement');
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
      Navigator.pop(context, false);
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
