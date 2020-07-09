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
        title: Center(child: Text("FullStack Developer")),
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
                heading: 'QA Analyst',
                txt:
                    'The main focus of a QA analyst is testing, troubleshooting and problem-solving. '
                    'QA analysts are specialized in the software development lifecycle phase of testing.'
                    ' \n\n '
                    'Every Full Stack Ninja must have their tools! And so there are multiple skills that are required '
                    'for a Full Stack Web Developer ranging across different fields',
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    'How to become a FullStack Developer?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Times new Roman',
                    ),
                  ),
                ),
              ),
              FlatButton(
                  onPressed: () => Navigator.pushNamed(context, '/front'),
                  child: Tile(
                    heading: ' Front End Development',
                    txt: 'Click here',
                  )),
              FlatButton(
                  onPressed: () => Navigator.pushNamed(context, '/back'),
                  child: Tile(
                    heading: ' Back End Development',
                    txt: 'Click here',
                  )),
              Tile(
                heading: 'Version Control System',
                txt:
                    'It’s basically a system that records the changes made to the application '
                    'files over time so that specific versions can be recalled later if required.',
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
