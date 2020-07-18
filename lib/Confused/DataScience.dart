import 'package:collegopedia/Confused/technical/Tile.dart';
import 'package:flutter/material.dart';

class DataScientist extends StatefulWidget {
  @override
  _DataScientistState createState() => _DataScientistState();
}

class _DataScientistState extends State<DataScientist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(" Data Scientist ")),
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
                  heading: 'What exactly a data scientist?',
                  txt:
                      'In an over-simplified description, a data scientist is a '
                      'professional who can work with a large amount of data and '
                      'extract analytical insights. They communicate their findings '
                      'to the stakeholders (i.e., senior leadership, management, '
                      'and clients). Thus, companies can benefit from making the '
                      'best-informed decisions to drive their business growth and '
                      'profitability (i.e., depends on the context of industries).'),
              Tile(
                heading: 'What to learn data science?',
                txt:
                    'Step 1, catching up on the basic math related to statistics, calculus and linear algebra is a good start. \n '
                    'Step 2, data scientists must be familiar with a toolset to work with data in various environments. '
                    'A toolset contains a combination of SQL, command line, coding and cloud tool. \n '
                    'Step 3, this is the best time to pick up some language for building the data science foundation.'
                    'From open source platforms, many people choose either R or Python. \n'
                    'Step 4, this is the most crucial step to showcase your potential as a data scientist candidate. '
                    'Once you familiarize yourself with doing the data science, one must have a project portfolio. '
                    'A project portfolio is your best opportunity to show what you have done from learning and work experiences. '
                    'Starting from the data collection (i.e., where to pick or scrape data on your own), come up with your hypothesis, '
                    'perform exploratory analysis (i.e., extract some interesting insights), build your machine learning model(s) '
                    'and finally share your findings from write up or presentations. ',
              ),
              Tile(
                heading: 'How to learn data science?',
                txt:
                    'Here is a full list of resources you can reference for learning each building block of the data science education.\n '
                    '1. Math: \n '
                    'Khan Academy Math Track \n '
                    'MIT Open Courseware: linear algebra and calculus \n'
                    'Udacity: Intro and Inferential Statistics \n\n'
                    'Data Science Toolkit: \n '
                    'SQL \n'
                    'Command Line \n'
                    'Python Coding \n\n '
                    '3. Machine Learning: \n '
                    'Coursera: Machine Learning by Andrew Ng (*) \n\n '
                    '4. Big Data:\n '
                    ' Hadoop \n '
                    ' Spark \n ',
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
