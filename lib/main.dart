import 'package:collegopedia/Confused/BusinessDevelopment.dart';
import 'package:collegopedia/Confused/ConfusedMainPage.dart';
import 'package:collegopedia/Confused/DataScience.dart';
import 'package:collegopedia/Confused/artificial.dart';
import 'package:collegopedia/Confused/technical/backendpage.dart';
import 'package:collegopedia/Confused/technical/cybersecurity.dart';
import 'package:collegopedia/Confused/technical/frontendPage.dart';
import 'package:collegopedia/Confused/technical/fullstackpage.dart';
import 'package:collegopedia/Confused/technical/mobilepage.dart';
import 'package:collegopedia/Confused/technical/qualityassurance.dart';
import 'package:collegopedia/Confused/technical/technicalpagemain.dart';
import 'package:collegopedia/Contest/Contest.dart';
import 'package:collegopedia/Discussion/AddQuestion.dart';
import 'package:collegopedia/Discussion/DiscussionForum.dart';
import 'package:collegopedia/Discussion/QuestionSpecificPage.dart';
import 'package:collegopedia/Home/HomePage.dart';
import 'package:collegopedia/Job/JobSection.dart';
import 'package:collegopedia/Job/addJobOpening.dart';
import 'package:collegopedia/Job/currentopening.dart';
import 'package:collegopedia/LoginPage/Login_page.dart';
import 'package:collegopedia/Placement/CompanySpecficList.dart';
import 'package:collegopedia/Placement/Placement.dart';
import 'package:collegopedia/Placement/add_your_experience_page.dart';
import 'package:collegopedia/about.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';
import 'package:collegopedia/globals.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:package_info/package_info.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

void main() => runApp(MyApp());
String companyNameSpecific;
String specificQuestion;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('images/mainback.jpg'), context);
    return MaterialApp(
      title: 'Collegopedia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          //backgroundColor: Color(0xFF4A5065),
          primaryColorDark: Color(0xFF4A5065),
          appBarTheme: AppBarTheme(
            color: Color(0xFF0E0F1B),
          )),
      routes: <String, WidgetBuilder>{
        '/main': (BuildContext context) => MyApp(),
        '/home': (BuildContext context) => Home(),
        '/login': (BuildContext context) => LoginPage(),
        '/placement': (BuildContext context) => PlacementPage(),
        '/confused': (BuildContext context) => ConfusedMainPage(),
        '/addexperience': (BuildContext context) => AddYourExperience(),
        '/company': (BuildContext context) =>
            CompanySpecificPlacementPage(),
        '/contest': (BuildContext context) => Contest(),
        '/job': (BuildContext context) => JobSection(),
        '/discuss': (BuildContext context) => DiscussionForum(),
        '/question': (BuildContext context) => AddQuestion(),
        '/tech': (BuildContext context) => TechnicalPage(),
        '/back': (BuildContext context) => BackEndPage(),
        '/fullstack': (BuildContext context) => FullStackPage(),
        '/front': (BuildContext context) => FrontEndPage(),
        '/mobile': (BuildContext context) => MobileDeveloperPage(),
        '/quality': (BuildContext context) => QualityAssurancePage(),
        '/artificial': (BuildContext context) => ArtificialIntelligence(),
        '/datascience': (BuildContext context) => DataScientist(),
        '/cyber': (BuildContext context) => CyberSecurity(),
        '/questionspecific': (BuildContext context) =>
            QuestionSpecificPage(),
        '/about': (BuildContext context) => About(),
        '/current': (BuildContext context) => JobOpening(),
        '/addjob': (BuildContext context) => AddJobOpening(),
        '/business':(BuildContext context)=>BusinessDevelopmentPage(),
      },
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  bool flag = false;
  @override
  void initState() {
    super.initState();

    //signInWithGoogle();
    Timer.run(() {
      try {
        InternetAddress.lookup('google.com').then((result) {
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            print('connected');
            getUser().then((user) {
              if (user != null) {
                userName = (user.displayName);
                print(userName);
                // Navigator.pushNamed(context, '/home');
                flag = true;
              }
            });
          } else {
            _showDialog(); // show dialog
          }
        }).catchError((error) {
          _showDialog(); // show dialog
        });
      } on SocketException catch (_) {
        _showDialog();
        print('not connected'); // show dialog
      }
    });

    loadData();
  }

  Future<FirebaseUser> getUser() async {
    return await _auth.currentUser();
  }

  void _showDialog() {
    // dialog implementation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Internet needed!"),
        content: Text("You may want to exit the app here"),
        actions: <Widget>[
          FlatButton(
              child: Text("EXIT"),
              onPressed: () {
                SystemNavigator.pop();
              })
        ],
      ),
    );
  }

  Future<Timer> loadData() async {
    print("Load");
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    print("Done");
    if (!flag) {
      print("login");
      Navigator.pop(context);
      Navigator.pushNamed(context, '/login');
    } else {
      print("home");
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('images/mainback.jpg'), context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/mainback.jpg'), fit: BoxFit.cover),
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
        ),
      ),
    );
  }
}
