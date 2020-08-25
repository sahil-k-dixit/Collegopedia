import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegopedia/globals.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void initState() {
    super.initState();
    print('Login page into');
    //signInWithGoogle();
//    Timer.run(() {
//      try {
//        InternetAddress.lookup('google.com').then((result) {
//          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//            print('connected');
//            getUser().then((user) {
//              if (user != null) {
//                userName = (user.displayName);
//
//                Navigator.pushNamed(context, '/home');
//              }
//            });
//          } else {
//            _showDialog(); // show dialog
//          }
//        }).catchError((error) {
//          _showDialog(); // show dialog
//        });
//      } on SocketException catch (_) {
//        _showDialog();
//        print('not connected'); // show dialog
//      }
//    });
  }
//  Future<FirebaseUser> getUser() async {
//    return await _auth.currentUser();
//  }
//
//  void _showDialog() {
//    // dialog implementation
//    showDialog(
//      context: context,
//      builder: (context) => AlertDialog(
//        title: Text("Internet needed!"),
//        content: Text("You may want to exit the app here"),
//        actions: <Widget>[
//          FlatButton(
//              child: Text("EXIT"),
//              onPressed: () {
//                SystemNavigator.pop();
//              })
//        ],
//      ),
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/mainback.jpg"), fit: BoxFit.cover)),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 70, 10, 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Collegopedia",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.display1,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 8, 50, 8),
                    child: Container(
                      color: Colors.transparent,
                      child: OutlineButton(
                        // color: Colors.blue,
                        splashColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        highlightElevation: 0,
                        borderSide: BorderSide(color: Colors.grey),
                        onPressed: () async {
                          var s = await signInWithGoogle();
                          print(s);
                          Navigator.pop(context);
                          Navigator.pushNamed(
                            context,
                            '/home',
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                  image: AssetImage("images/google_logo.png"),
                                  height: 35.0),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 20),
                                child: Text(
                                  'Sign in with Google',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
  print(googleSignInAccount);

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);

  final FirebaseUser user = authResult.user;

  if(authResult.additionalUserInfo.isNewUser)
    {
      final Firestore _firestore = Firestore.instance;
      final FirebaseMessaging _messaging = FirebaseMessaging();
      _messaging.getToken().then((token) {
        _firestore.collection('pushtoken').add({'devtoken':token});
      });
      _firestore.collection('userInfo').add({'userName':authResult.user.displayName,
      'email':authResult.user.email});
    }
  userName = authResult.user.displayName;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
}
