import 'package:collegopedia/Discussion/QuestionSpecificPage.dart';
import 'package:collegopedia/globals.dart';
import 'package:flutter/material.dart';

class QuestionListTile extends StatelessWidget {
  String questionText;

  QuestionListTile(this.questionText);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: tileDecoration,
        child: FlatButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => QuestionSpecificPage(questionText)));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              questionText,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
