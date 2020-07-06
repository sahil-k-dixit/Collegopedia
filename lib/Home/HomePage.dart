import 'package:collegopedia/DataSearch/DataSearch.dart';
import 'package:collegopedia/Drawer/DrawerBarr.dart';
import 'package:collegopedia/Home/HomePageTile.dart';
import 'package:collegopedia/globals.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Collegopedia")),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
      backgroundColor: Color(0xFF010101),
      drawer: DrawerrBarr(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white12, //Color(0xFFD0F0BF),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(),
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Welcome to Collegopedia, ${userName.split(" ")[0]}",
                        style: TextStyle(
                            fontFamily: 'Times new Roman',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Text(
                            'This platform is build to help people who is seeking help in any way possible.\n'
                            'Your College mate.\n'
                            'Worrying about Placements?\n'
                            'Have an Query?\n'
                            'This Platform have it all covered for you.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Times new Roman',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Color(0xFF1C1B20),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        HomePageTile(
                            'images/placement.jpg',
                            FlatButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/placement'),
                                child: null)),
                        HomePageTile(
                            'images/job.jpg',
                            FlatButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/job'),
                                child: null)),
                        HomePageTile(
                            'images/discussion.jpg',
                            FlatButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/discuss'),
                                child: null)),
                        HomePageTile(
                            'images/contest.jpg',
                            FlatButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/contest'),
                                child: null)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/question');
        },
        icon: Icon(Icons.add),
        label: Text("Got a Question?"),
      ),
    );
  }
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}
