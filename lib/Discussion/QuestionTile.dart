//import 'dart:html';

import 'package:collegopedia/Discussion/QuestionSpecificPage.dart';
import 'package:collegopedia/argumentModel.dart';
import 'package:collegopedia/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionListTile extends StatelessWidget {
  String questionText;

  QuestionListTile(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        onPressed: () {
//            Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) => QuestionSpecificPage(questionText)));
        Navigator.pushNamed(context, '/questionspecific',arguments: ArgumentModel(questionText));
        },
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Text(
                    questionText,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.display1,
                      //  color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Icon(Icons.arrow_forward_ios,color: Colors.grey,)
              ],
            ),
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Text('Click here to view the discussion',style: TextStyle(
//                fontSize: 8,
//                color: Colors.grey
//              ),),
//            ),
          ],
        ),
      ),
    );
  }
}
