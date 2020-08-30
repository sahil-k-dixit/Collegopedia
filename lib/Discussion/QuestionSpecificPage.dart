import 'package:collegopedia/argumentModel.dart';
import 'package:collegopedia/globals.dart';
import 'package:collegopedia/readMore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class QuestionSpecificPage extends StatefulWidget {
  @override
  _QuestionSpecificPageState createState() => _QuestionSpecificPageState();
}

class _QuestionSpecificPageState extends State<QuestionSpecificPage> {
  bool isAnswer = false;
  final _formKey = GlobalKey<FormState>();
  final answer = TextEditingController();
  //
  final dbRef = FirebaseDatabase.instance.reference().child("Questions");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // questionText = widget.questionText;
  }

  @override
  Widget build(BuildContext context) {
    final ArgumentModel arg = ModalRoute.of(context).settings.arguments;
    String questionText = arg.args;
    return Scaffold(
       // backgroundColor: Color(0xFF1D1F2D),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Discussion',
              style: appBarHeaderTextStyle,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        // decoration: tileDecoration,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 18, 8, 0),
                          child: Center(
                            child: Text(
                              questionText,
// textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.display1,
                                 // color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
// this is for writing answer
                      isAnswer
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                              child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        maxLength: 1000,
                                        minLines: 5,
                                        maxLines: 15,
                                        controller: answer,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Empty field ';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Write your answer",
                                          hintStyle: hintTextStyle,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          child: FlatButton(
                                            color: Colors.lightBlue,
                                            onPressed: () {
                                              if (_formKey.currentState
                                                  .validate()) {
                                                dbRef
                                                    .child(questionText)
                                                    .child("Answers")
                                                    .push()
                                                    .set({
                                                  "answertext": answer.text,
                                                  "user": userName,
                                                });
                                                answer.clear();
                                                isAnswer = false;
                                                // showAlertDialog(context);
                                                // Navigator.pushNamed(context, '/discuss');
                                              }
                                            },
                                            child: Text('Submit'),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            )
                          : Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Container(
                                  //decoration: tileDecoration,
                                  //width: 150,
                                  child: FlatButton(
                                      onPressed: () {
                                        setState(() {
                                          isAnswer = true;
                                        });
                                      },
                                      child: Row(
                                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.text_format,
                                            size: 16,
                                            color: Colors.redAccent,
                                          ),
                                          Text(
                                            'Write Answer',
                                            style: GoogleFonts.lato(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .display1,
                                                color: Colors.redAccent,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal),
                                          )
                                        ],
                                      ))),
                            ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Container(
                          child: Text(
                            "Answers",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      AnswerStream(questionText),
                    ],
                  ),
                  // AnswerStream(questionText),
                ],
              ),
            ),
          ),
        ));
  }
}

class AnswerStream extends StatelessWidget {
  String questionText;
  List<Widget> answerList = [];

  AnswerStream(this.questionText);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseDatabase()
            .reference()
            .child("Questions")
            .child(questionText)
            .child("Answers")
            .onValue,
        builder: (context, snap) {
          if (snap.hasData &&
              !snap.hasError &&
              snap.data.snapshot.value != null) {
            Map<dynamic, dynamic> data = snap.data.snapshot.value;

            answerList = [];
            data.forEach((index, data) {
              final answerItem = AnswerItem(data['answertext'], data['user']);
              answerList.add(answerItem);
            });
            //print(questionList);
            return Column(
              children: answerList,
            );
          } else {
            return Center(child: Text("No Answers yet"));
          }
        });
  }
}

class AnswerItem extends StatelessWidget {
  String answerText;
  String userName;

  AnswerItem(this.answerText, this.userName);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        //decoration: tileDecoration,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 0.5,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Written by: ${userName}",
                style: textStyle.copyWith(fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: ReadMoreText(
                answerText,
                trimLines: 2,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText: '...Show more',
                trimExpandedText: ' show less',
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.display1,
                  //  color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
