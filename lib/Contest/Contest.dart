import 'package:collegopedia/Contest/ContestTile.dart';
import 'package:collegopedia/Drawer/DrawerBarr.dart';
import 'package:flutter/material.dart';

class Contest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Contest")),
        ),
        drawer: DrawerrBarr(),
        backgroundColor: Color(0xFF010101),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                            fontSize: 25,
                            fontStyle: FontStyle.italic),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'It allows programmer to improve their knowledge on data structures and algorithms and the way of using those according to the problem statement.'
                          ' Competitive coding is independent of programming language.  '
                          'The understanding and solving the problem using algorithms and data structures is important here.'
                          'So simple if want to crack into big tech or startup who should participate in competitive coding'
                          'Incase if are asking someone to refer you competitive coding plays a vital role. ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            wordSpacing: 5,
                            letterSpacing: 1,
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Times new Roman',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ContestTile(
                txt: 'Participate in Hackerrank Events',
                url: 'https://www.hackerrank.com/contests',
              ),
              ContestTile(
                txt: 'Participate in Hackerearth Events',
                url: 'https://www.hackerearth.com/challenges/',
              ),
              ContestTile(
                txt: 'Participate in CodeChef Events',
                url: 'https://www.codechef.com/contests',
              ),
              ContestTile(
                txt: 'Participate in CodeForces Events',
                url: 'https://codeforces.com/contests',
              ),
              ContestTile(
                txt: 'Live Events',
                url: '',
              ),
            ],
          ),
        ));
  }
}
