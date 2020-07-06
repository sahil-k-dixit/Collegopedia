import 'package:collegopedia/Placement/MessageModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String userName = " ";
List<MessageModel> listOfMessage = [];
List<String> companyList = [];
List<String> questionList = [];

TextStyle textStyle = TextStyle(color: Colors.white);

BoxDecoration tileDecoration = BoxDecoration(
    color: Color(0xFF1C1B20),
    // backgroundBlendMode: BlendMode.colorBurn,
    borderRadius: BorderRadius.circular(10),
    shape: BoxShape.rectangle,
    border: Border.all(color: Colors.grey, width: 2, style: BorderStyle.solid));
