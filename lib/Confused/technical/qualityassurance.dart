import 'package:collegopedia/Confused/technical/Tile.dart';
import 'package:flutter/material.dart';

class QualityAssurancePage extends StatefulWidget {
  @override
  _QualityAssurancePageState createState() => _QualityAssurancePageState();
}

class _QualityAssurancePageState extends State<QualityAssurancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(" QA Engineer ")),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Color(0xFF0E0F1B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Tile(
                  heading: 'QA Engineer',
                  txt:
                      'The main focus of a QA analyst is testing, troubleshooting and problem-solving. '
                      'QA analysts are specialized in the software development lifecycle phase of testing.'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    'How to become a QA Engineer ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Times new Roman',
                    ),
                  ),
                ),
              ),
              Tile(
                heading: 'Required Skill Set',
                txt: 'Understanding and use of QA methodologies'
                    '\nSQL'
                    ' \nSDLC'
                    '\nAbility to research'
                    '\nUnderstanding and use of Agile methodologies'
                    '\nTest planning, testing, and test automation'
                    '\nRisk analysis'
                    '\nTroubleshooting'
                    '\nAbility to use source code repositories'
                    ' \nDocumentation skills',
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid)),
                  child: FlatButton(
                    onPressed: () => Navigator.pushNamed(context, '/home'),
                    child: Text(
                      'Check out other sections to prepare and apply for jobs and much more...  Click here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontFamily: 'Times new Roman',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
