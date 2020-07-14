import 'package:collegopedia/Drawer/DrawerClass.dart';
import 'package:collegopedia/Home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerrBarr extends StatelessWidget {
  const DrawerrBarr({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Container(
                    child: Image.asset(
                      'images/university.png',
                      width: 39,
                      height: 39,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Collegopedia',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.headline4,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                DrawerBar('Home', Icon(Icons.home)),
                DrawerBar('Placement Section', Icon(Icons.import_export)),
                DrawerBar('Jobs', Icon(Icons.business_center)),
                DrawerBar('Contest', Icon(Icons.event)),
                DrawerBar('Discussion', Icon(Icons.question_answer)),
               // DrawerBar('Buy/Sell Resources', Icon(Icons.business)),
               // DrawerBar('Confused?', Icon(Icons.help)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: Colors.grey,
                          width: 1,
                          style: BorderStyle.solid),
                      bottom: BorderSide(
                          color: Colors.grey,
                          width: 1,
                          style: BorderStyle.solid))),
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    child: FlatButton(
                      onPressed: () {
                        signOutGoogle();
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login', (Route<dynamic> route) => false);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              child: Container(
                                child: Image.asset(
                                  'images/logout.png',
                                  width: 39,
                                  height: 39,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Center(
                                child: Text(
                              'Sign out',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.display1,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            )),
                          ),
                          Expanded(
                              flex: 1, child: Icon(Icons.arrow_forward_ios)),
                        ],
                      ),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
