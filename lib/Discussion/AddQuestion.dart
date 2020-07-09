import 'package:collegopedia/globals.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddQuestion extends StatefulWidget {
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final dbRef = FirebaseDatabase.instance.reference().child("Questions");

  final _formKey = GlobalKey<FormState>();
  final question = TextEditingController();
  final name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Question'),
        ),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
//              Padding(
//                  padding: EdgeInsets.all(20),
//                  child: TextFormField(
//                    maxLength: 30,
//                    controller: name,
//                    validator: (value) {
//                      if (value.isEmpty) {
//                        return 'Please enter your name ';
//                      }
//                      return null;
//                    },
//                    decoration: InputDecoration(
//                      hintText: "Enter your name",
//                      enabledBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(10.0),
//                      ),
//                    ),
//                  )),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    child: TextFormField(
                      enableSuggestions: true,
                      maxLength: 100,
                      minLines: 5,
                      maxLines: 10,
                      controller: question,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your question ';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter your question",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  )),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: FlatButton(
                    color: Colors.lightBlue,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        dbRef.child(question.text).push().set({
                          "name": userName,
                          "vote": 0,
                        });
                        name.clear();
                        question.clear();

                        showAlertDialog(context);
                        //Navigator.pushNamed(context, '/discuss');
                      }
                    },
                    child: Text('Add'),
                  ),
                ),
              )
            ],
          )),
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
