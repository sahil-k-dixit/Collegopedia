import 'package:url_launcher/url_launcher.dart';
import 'package:collegopedia/Placement/add_your_experience_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddJobOpening extends StatefulWidget {
  @override
  _AddJobOpeningState createState() => _AddJobOpeningState();
}

class _AddJobOpeningState extends State<AddJobOpening> {
  final _formKey = GlobalKey<FormState>();
  final dbRef = FirebaseDatabase.instance.reference();
  final decription = TextEditingController();
  final name = TextEditingController();
  final title = TextEditingController();
  final link = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Job Opening"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
               // Name
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  maxLength: 100,
                  controller: name,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter title of organization/company ';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "title of organization/company",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  maxLength: 100,
                  controller: title,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Job Title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Job Title",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  maxLength: 1000,
                  minLines: 5,
                  maxLines: 10,
                  controller: decription,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter desciption about job ';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Desciption about job",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    maxLength: 500,
                    minLines: 5,
                    maxLines: 10,
                    controller: link,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please attach application link ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "application link",
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
                        dbRef.child('jobOpening').push().set({
                          "description":decription.text,
                          "link":link.text,
                          "name":name.text,
                          "title":title.text
                        });
                        link.clear();
                        decription.clear();
                        name.clear();
                        title.clear();
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
