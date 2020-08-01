import 'package:collegopedia/Drawer/DrawerBarr.dart';
import 'package:collegopedia/UniversalTile.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        backgroundColor: Color(0xFF1D1F2D),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            MainTile(
              colorBox: Colors.blue,
              txt: 'Checkout ongoing job',
              // url: '',
              onPress: ()=>Navigator.pushNamed(context, '/current'),
              imageURL: 'images/Contest/calendar.png',
              heading: 'Current Opening ',
            ),
            MainTile(
              colorBox: Colors.orangeAccent,
              txt: 'Want to work with Startups? \n' +
                  'Looking for internships? \n' +
                  'Stand a chance with Angellist \n' +
                  'Click here we will land to the place',
              // url: 'https://angel.co/jobs',
              onPress: () async {
                //const url = 'https://flutter.dev';
                if (await canLaunch('https://angel.co/jobs')) {
                  await launch('https://angel.co/jobs');
                } else {
                  throw 'Could not launch https://angel.co/jobs';
                }
              },
              imageURL: 'images/Job/target.png',
              heading: 'Startups',
            ),
            MainTile(
              colorBox: Colors.grey,
              heading: 'Work Internationally',
              imageURL: 'images/Job/international.png',
              txt: 'Want to work in different Countires?\n' +
                  'Stand a chance with Stackoverflow \n' +
                  'Click here we will land to the place',
              onPress: () async {
                //const url = 'https://flutter.dev';
                if (await canLaunch('https://stackoverflow.com/jobs')) {
                  await launch('https://stackoverflow.com/jobs');
                } else {
                  throw 'Could not launch https://stackoverflow.com/jobs';
                }
              },
            ),
            MainTile(
              colorBox: Colors.blueGrey,
              txt: 'Want to improve your aptitude skills? \n' +
                  'Stand a chance with IndiaBix \n' +
                  'Click here we will land to the place',
              onPress: () async {
                //const url = 'https://flutter.dev';
                if (await canLaunch('https://www.indiabix.com/')) {
                  await launch('https://www.indiabix.com/');
                } else {
                  throw 'Could not launch https://www.indiabix.com/';
                }
              },
              imageURL: 'images/Job/speed.png',
              heading: 'Aptitude',
            ),
            MainTile(
              colorBox: Colors.lime,
              heading: 'Coding Skills',
              imageURL: 'images/Job/computer.png',
              txt: 'Want to improve your coding skills? \n' +
                  'Stand a chance with GeeksForGeeks \n' +
                  'Click here we will land to the place',
              onPress: () async {
                //const url = 'https://flutter.dev';
                if (await canLaunch('https://www.geeksforgeeks.org/')) {
                  await launch('https://www.geeksforgeeks.org/');
                } else {
                  throw 'Could not launch https://www.geeksforgeeks.org/';
                }
              },
            ),
            MainTile(
              colorBox: Colors.red,
              heading: 'Personal Interview',
              txt: 'Want to improve your personal interview skills? \n' +
                  'Want to take mock Interviews ? \n'
                      'Stand a chance with InterviewBit \n' +
                  'Click here we will land to the place',
              onPress: () async {
                //const url = 'https://flutter.dev';
                if (await canLaunch('https://www.interviewbit.com/')) {
                  await launch('https://www.interviewbit.com/');
                } else {
                  throw 'Could not launch https://www.interviewbit.com/';
                }
              },
              imageURL: 'images/Job/interview.png',
            ),
          ],
        ));
  }
}
