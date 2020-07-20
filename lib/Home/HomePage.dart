import 'package:collegopedia/Drawer/DrawerBarr.dart';
import 'package:collegopedia/UniversalTile.dart';
import 'package:collegopedia/globals.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('You are going to sigout the application!!'),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES'),
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0E0F1B),
        title: Center(
            child: Text(
          "Collegopedia",
          style: TextStyle(
            fontFamily: 'Lato Font Family',
          ),
        )),
      ),
      backgroundColor: Color(0xFF1D1F2D),
      drawer: DrawerrBarr(),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: mainColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    ("HI " + userName.split(" ")[0]).toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.display1,
                        color: Colors.white,
                        fontSize: 11),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: mainColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome to Collegopedia',
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.display1,
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: mainColor,
              ),
              //height: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Text(
                  'Stay connected with Collegopedia. Our portal gives you an access to learning resources, '
                  'discussions and assists with college planning and preparation.',
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.display1,
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: 12),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: mainColor),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 30, 10),
                child: Align(
                    child: Text(
                  'Please select your area of interest:',
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.display1,
                      color: Colors.grey,
                      fontSize: 12,
                      fontStyle: FontStyle.italic),
                )),
              ),
            ),
            MainTile(
              imageURL: 'images/Home/Job.png',
              txt: 'Checkout the experiences of placements',
              colorBox: Color(0xFFFFCE46),
              heading: 'Placement',
              onPress: () => Navigator.pushNamed(context, '/placement'),
            ),
            MainTile(
              imageURL: 'images/Home/Jobseek.png',
              txt: 'Looking for jobs?',
              colorBox: Color(0xFF7BE1FA),
              heading: 'Jobs',
              onPress: () => Navigator.pushNamed(context, '/job'),
            ),
            MainTile(
              imageURL: 'images/Home/Discussion.png',
              txt: 'Have a Query? Discuss with us',
              colorBox: Color(0xFFDC5858),
              heading: 'Discussion',
              onPress: () => Navigator.pushNamed(context, '/discuss'),
            ),
            MainTile(
              imageURL: 'images/Home/trophy.png',
              txt: 'Participate in competitive coding events.',
              colorBox: Color(0xFFAEFFA1),
              heading: 'Contest',
              onPress: () => Navigator.pushNamed(context, '/contest'),
            ),
          MainTile(
            imageURL: 'images/Home/confused.png',
            txt: ' Dont know from where to start and how to start',
            colorBox: Colors.red,
            heading: 'Confused?',
            onPress: () => Navigator.pushNamed(context, '/confused'),
          ),
          ],
        ),
      ),
    );
  }
}

void signOutGoogle() async {
  await _auth.signOut();
  await googleSignIn.signOut();

  print("User Sign Out");
}
