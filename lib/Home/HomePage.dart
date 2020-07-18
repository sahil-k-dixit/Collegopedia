import 'package:collegopedia/Drawer/DrawerBarr.dart';
import 'package:collegopedia/UniversalTile.dart';
import 'package:collegopedia/globals.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
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
  Future<bool> onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('You are going to log out from the  application!!'),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES'),
                onPressed: ()
                {
                  signOutGoogle();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (Route<dynamic> route) => false);
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
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        // crossAxisAlignment: CrossAxisAlignment.center,
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
//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: () {
//          Navigator.pushNamed(context, '/question');
//        },
//        icon: Icon(Icons.add),
//        label: Text("Got a Question?"),
//      ),
    );
  }
}

void signOutGoogle() async {
  await _auth.signOut();
  await googleSignIn.signOut();

  print("User Sign Out");
}




//class HomeTile extends StatelessWidget {
//  String heading;
//  String txt;
//  String url;
//  Color colorBox;
//  Function onPress;
//  HomeTile({this.url, this.txt, this.colorBox, this.heading, this.onPress});
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.fromLTRB(40, 9, 40, 8),
//      child: Container(
//        decoration: BoxDecoration(
//          color: Color(0xFF4A5065),
//          boxShadow: [
//            BoxShadow(
//              offset: const Offset(3.0, 3.0),
//              //color: Colors.grey,
//              blurRadius: 3.0,
//              spreadRadius: 0,
//            ),
//          ],
//          borderRadius: BorderRadius.circular(5),
//        ),
//        child: FlatButton(
//          onPressed: onPress,
//          child: Padding(
//            padding: const EdgeInsets.all(10.0),
//            child: Row(
//              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              //crossAxisAlignment: CrossAxisAlignment.stretch,
//              children: <Widget>[
//                Expanded(
//                  flex: 1,
//                  child: SizedBox(
//                    width: 60,
//                    height: 60,
//                    child: Container(
//                      decoration: BoxDecoration(
//                          color: colorBox,
//                          shape: BoxShape.circle,
//                          boxShadow: [
//                            BoxShadow(
//                              offset: const Offset(3.0, 3.0),
//                              blurRadius: 5.0,
//                              spreadRadius: 2.0,
//                            ),
//                          ]),
//                      child: Image.asset(
//                        url,
//                        width: 39,
//                        height: 39,
//                      ),
//                    ),
//                  ),
//                ),
//                Expanded(
//                  flex: 3,
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Text(
//                          heading,
//                          textAlign: TextAlign.center,
//                          style: GoogleFonts.lato(
//                              textStyle: Theme.of(context).textTheme.display1,
//                              color: Colors.white,
//                              fontWeight: FontWeight.bold,
//                              fontSize: 16),
//                        ),
//                        Text(
//                          txt,
//                          textAlign: TextAlign.center,
//                          style: GoogleFonts.lato(
//                              textStyle: Theme.of(context).textTheme.display1,
//                              color: Colors.grey,
//                              fontSize: 12),
//                        )
//                      ],
//                    ),
//                  ),
//                ),
//                Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios))
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}

