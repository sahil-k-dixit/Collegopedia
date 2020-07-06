import 'package:collegopedia/Contest/Contest.dart';
import 'package:collegopedia/Discussion/AddQuestion.dart';
import 'package:collegopedia/Discussion/DiscussionForum.dart';
import 'package:collegopedia/Discussion/QuestionSpecificPage.dart';
import 'package:collegopedia/Home/HomePage.dart';
import 'package:collegopedia/Job/JobSection.dart';
import 'package:collegopedia/LoginPage/Login_page.dart';
import 'package:collegopedia/Placement/CompanySpecficList.dart';
import 'package:collegopedia/Placement/Placement.dart';
import 'package:collegopedia/Placement/add_your_experience_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());
String companyNameSpecific;
String specificQuestion;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('images/a.jpg'), context);
    return MaterialApp(
      title: 'Collegopedia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => Home(),
        '/login': (BuildContext context) => LoginPage(),
        '/placement': (BuildContext context) => PlacementPage(),
        '/addexperience': (BuildContext context) => AddYourExperience(),
        '/company': (BuildContext context) =>
            CompanySpecificPlacementPage(companyNameSpecific),
        '/contest': (BuildContext context) => Contest(),
        '/job': (BuildContext context) => JobSection(),
        '/discuss': (BuildContext context) => DiscussionForum(),
        '/question': (BuildContext context) => AddQuestion(),
        '/questionspecific': (BuildContext context) =>
            QuestionSpecificPage(specificQuestion),
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
  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('images/a.jpg'), context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/a.jpg'), fit: BoxFit.cover),
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
        ),
      ),
    );
  }
}
