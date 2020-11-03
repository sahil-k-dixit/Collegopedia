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
          child: Text('Question',style: appBarHeaderTextStyle,),
        ),
      ),
     // backgroundColor: mainColor,
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    child: TextFormField(
                      enableSuggestions: true,
                      maxLength: 300,
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
                        hintStyle: hintTextStyle,
                        hintText: "Ask your question",
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
                    color: Colors.teal,
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
    content: Text("Submitted Successfully !"),
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
