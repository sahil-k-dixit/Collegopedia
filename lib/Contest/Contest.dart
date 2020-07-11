import 'package:collegopedia/Drawer/DrawerBarr.dart';
import 'package:collegopedia/UniversalTile.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Contest")),
        ),
        drawer: DrawerrBarr(),
        backgroundColor: Color(0xFF010101),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                // height: 400,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                        color: Colors.white,
                        width: 2,
                        style: BorderStyle.solid)),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Why Contest ?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          'It allows programmer to improve their knowledge on data structures and algorithms and the way of using those according to the problem statement.'
                          ' Competitive coding is independent of programming language.  '
                          'The understanding and solving the problem using algorithms and data structures is important here.'
                          'So simple if want to crack into big tech or startup who should participate in competitive coding. '
                          'Incase if are asking someone to refer you competitive coding plays a vital role. ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Times new Roman',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            MainTile(
              txt: 'Checkout the ongoing events',
              // url: '',
              imageURL: 'images/Contest/calendar.png',
              heading: 'Live Events',
            ),
            MainTile(
              txt: 'Participate in Hackerrank Events',
              //url: 'https://www.hackerrank.com/contests',
              onPress: () async {
                //const url = 'https://flutter.dev';
                if (await canLaunch('https://www.hackerrank.com/contests')) {
                  await launch('https://www.hackerrank.com/contests');
                } else {
                  throw 'Could not launch https://www.hackerrank.com/contests';
                }
              },
              heading: 'Hackkerank',
              imageURL: 'images/Contest/medal.png',
            ),
            MainTile(
              txt: 'Participate in Hackerearth Events',
              heading: 'Hackerearth',
              imageURL: 'images/Contest/contest.png',
              onPress: () async {
                //const url = 'https://flutter.dev';
                if (await canLaunch(
                    'https://www.hackerearth.com/challenges/')) {
                  await launch('https://www.hackerearth.com/challenges/');
                } else {
                  throw 'Could not launch https://www.hackerearth.com/challenges/';
                }
              },
            ),
            MainTile(
              txt: 'Participate in CodeChef Events',
              heading: 'CodeChef',
              imageURL: 'images/Contest/cooking.png',
              onPress: () async {
                //const url = 'https://flutter.dev';
                if (await canLaunch('https://www.codechef.com/contests')) {
                  await launch('https://www.codechef.com/contests');
                } else {
                  throw 'Could not launch https://www.codechef.com/contests';
                }
              },
            ),
            MainTile(
              txt: 'Participate in CodeForces Events',
              heading: 'CodeForces',
              imageURL: 'images/Contest/gym.png',
              colorBox: Colors.white,
              onPress: () async {
                //const url = 'https://flutter.dev';
                if (await canLaunch('https://codeforces.com/contests')) {
                  await launch('https://codeforces.com/contests');
                } else {
                  throw 'Could not launch https://codeforces.com/contests';
                }
              },
            ),
          ],
        ));
  }
}
