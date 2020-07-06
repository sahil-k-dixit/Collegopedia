import 'package:collegopedia/globals.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JobTile extends StatelessWidget {
  _launchURL() async {
    //const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String txt;
  String url;

  JobTile({this.txt, this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width / 2,
        decoration: tileDecoration,
        child: FlatButton(
          onPressed: _launchURL,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                txt,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Times new Roman',
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
