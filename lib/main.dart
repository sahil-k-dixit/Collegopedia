import 'package:collegopedia/BuyandSell/Sell.dart';
import 'package:collegopedia/BuyandSell/buy.dart';
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
        '/company/$companyNameSpecific': (BuildContext context) =>
            CompanySpecificPlacementPage(companyNameSpecific),
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
        '/buy':(BuildContext context)=>BuyPage(),
        '/sell': (BuildContext context)=> SellPage(),
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
