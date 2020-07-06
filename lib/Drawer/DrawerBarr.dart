import 'package:collegopedia/Drawer/DrawerClass.dart';
import 'package:collegopedia/Home/HomePage.dart';
import 'package:flutter/material.dart';

class DrawerrBarr extends StatelessWidget {
  const DrawerrBarr({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        //padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: null,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/a.png'), fit: BoxFit.cover)),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                DrawerBar('Home', Icon(Icons.home)),
                DrawerBar('Placement Section', Icon(Icons.import_export)),
                DrawerBar('Jobs', Icon(Icons.business_center)),
                DrawerBar('Contest', Icon(Icons.event)),
                DrawerBar('Discussion', Icon(Icons.question_answer)),
              ],
            ),
          ),
          Container(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(
                children: <Widget>[
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text(
                      "Sign out",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 15),
                    ),
                    onTap: () {
                      signOutGoogle();
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (Route<dynamic> route) => false);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
