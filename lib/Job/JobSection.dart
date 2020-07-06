import 'package:collegopedia/Drawer/DrawerBarr.dart';
import 'package:collegopedia/Job/JobTile.dart';
import 'package:flutter/material.dart';

class JobSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Job Section",
              style: TextStyle(),
            ),
          ),
        ),
        drawer: DrawerrBarr(),
        backgroundColor: Color(0xFF010101),
        body: ListView(
          children: <Widget>[
            JobTile(
              txt: 'Want to work with Startups? \n' +
                  'Looking for internships? \n' +
                  'Stand a chance with Angellist \n' +
                  'Click here we will land to the place',
              url: 'https://angel.co/jobs',
            ),
            JobTile(
              txt: 'Want to work in different Countires?\n' +
                  'Stand a chance with Stackoverflow \n' +
                  'Click here we will land to the place',
              url: 'https://stackoverflow.com/jobs',
            ),
            JobTile(
              txt: 'Want to improve your apptitude skills? \n' +
                  'Stand a chance with IndiaBix \n' +
                  'Click here we will land to the place',
              url: 'https://www.indiabix.com/',
            ),
            JobTile(
              txt: 'Want to improve your coding skills? \n' +
                  'Stand a chance with GeeksForGeeks \n' +
                  'Click here we will land to the place',
              url: 'https://www.geeksforgeeks.org/',
            ),
            JobTile(
              txt: 'Want to take mock Interviews ? \n' +
                  'Want to improve your personal interview skills? \n' +
                  'Stand a chance with InterviewBit \n' +
                  'Click here we will land to the place',
              url: 'https://www.interviewbit.com/',
            ),
          ],
        ));
  }
}
