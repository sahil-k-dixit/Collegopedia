import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegopedia/Drawer/DrawerBarr.dart';
import 'package:collegopedia/UniversalTile.dart';
import 'package:collegopedia/globals.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

const PLAY_STORE_URL =
    'https://play.google.com/store/apps/details?id=com.virus.collegopedia';
const APP_STORE_URL = '';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseMessaging _messaging = FirebaseMessaging();
  final Firestore _firestore = Firestore.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    versionCheck(context);
  }

  versionCheck(context) async {
    //Get Current installed version of app
    final PackageInfo info = await PackageInfo.fromPlatform();
    double currentVersion =
        double.parse(info.version.trim().replaceAll(".", ""));
      print(currentVersion);
    //Get Latest version info from firebase config
    final RemoteConfig remoteConfig = await RemoteConfig.instance;

    try {
      // Using default duration to force fetching from remote server.
      await remoteConfig.fetch(expiration: const Duration(seconds: 0));
      await remoteConfig.activateFetched();
      remoteConfig.getString('force_update_current_version');
      double newVersion = double.parse(remoteConfig
          .getString('force_update_current_version')
          .trim()
          .replaceAll(".", ""));
      if (newVersion > currentVersion) {
        _showVersionDialog(context);
      } else {
        print('Update');
      }
    } on FetchThrottledException catch (exception) {
      // Fetch throttled.
      print(exception);
    } catch (exception) {
      print('Unable to fetch remote config. Cached or default values will be '
          'used');
    }
  }

  _showVersionDialog(context) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String title = "New Update Available";
        String message =
            "There is a newer version of app available please update it now otherwise you miss many job oppurtunities and many features too.";
        String btnLabel = "Update Now";
        String btnLabelCancel = "Later";
        return Platform.isIOS
            ? new CupertinoAlertDialog(
                title: Text(title),
                content: Text(message),
                actions: <Widget>[
                  FlatButton(
                    child: Text(btnLabel),
                    onPressed: () => _launchURL(APP_STORE_URL),
                  ),
                  FlatButton(
                    child: Text(btnLabelCancel),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              )
            : new AlertDialog(
                title: Text(title),
                content: Text(message),
                actions: <Widget>[
                  FlatButton(
                    child: Text(btnLabel),
                    onPressed: () => _launchURL(PLAY_STORE_URL),
                  ),
                  FlatButton(
                    child: Text(btnLabelCancel),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              );
      },
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
              imageURL: 'images/about.png',
              txt: 'Know about us',
              colorBox: Color(0xFFAEFFA1),
              heading: 'About us!',
              onPress: () => Navigator.pushNamed(context, '/about'),
            )
//          MainTile(
//            imageURL: 'images/Home/confused.png',
//            txt: ' Dont know from where to start and how to start',
//            colorBox: Colors.red,
//            heading: 'Confused?',
//            onPress: () => Navigator.pushNamed(context, '/confused'),
//          ),
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
