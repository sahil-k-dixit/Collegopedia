import 'package:collegopedia/Confused/technical/Tile.dart';
import 'package:flutter/material.dart';

class MobileDeveloperPage extends StatefulWidget {
  @override
  _MobileDeveloperPageState createState() => _MobileDeveloperPageState();
}

class _MobileDeveloperPageState extends State<MobileDeveloperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Mobile App Developer")),
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
                heading: 'Mobile App Developer',
                txt:
                'So the question arises “What is the role of a Full Stack Web Developer?”'
                    'Well, a Full Stack Web Developer is the guy (or gal) who works on both the front-end and back-end portions of an '
                    'application while also knowing various other areas like Databases, Version Control System, Designing, etc. '
                    'There are various skill sets that are needed to fulfill all these never-ending requirements. So let’s focus on that now!'
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

/// Not Completed