import 'package:collegopedia/Placement/MessageModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String userName = " ";
List<MessageModel> listOfMessage = [];
List<String> companyList = [];
List<String> questionList = [];


TextStyle appBarHeaderTextStyle =  GoogleFonts.lato(
fontSize: 20,
//color: Colors.white,
fontWeight: FontWeight.bold,
fontStyle: FontStyle.italic
);


TextStyle textStyle = GoogleFonts.lato(
   // textStyle: Theme.of(context).textTheme.display1,
    color: Colors.grey,
    fontSize: 10);


TextStyle placementTextStyle = GoogleFonts.lato(
//    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.normal);

TextStyle hintTextStyle = GoogleFonts.lato(
    // textStyle: Theme.of(context).textTheme.display1,
    color: Colors.grey,
    fontStyle: FontStyle.italic,
    fontSize: 14);

BoxDecoration tileDecoration = BoxDecoration(
    //color: Color(0xFF1C1B20),
    // backgroundBlendMode: BlendMode.colorBurn,
    borderRadius: BorderRadius.circular(10),
    shape: BoxShape.rectangle,
//    boxShadow: [
//        BoxShadow(
//            offset: const Offset(3.0, 3.0),
//            color: Colors.grey,
//            blurRadius: 3.0,
//            spreadRadius: 0,
//        ),
//    ],
  //  border: Border.all(color: Colors.black54, width: 2, style: BorderStyle.solid)
);

Color mainColor = Color(0xFF1D1F2D);
