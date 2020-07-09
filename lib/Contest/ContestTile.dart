import 'package:collegopedia/globals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContestTile extends StatelessWidget {
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
  String heading;
  String imageURL;
  ContestTile({this.txt, this.url,this.imageURL,this.heading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF4A5065),
          boxShadow: [
            BoxShadow(
              offset: const Offset(3.0, 3.0),
              //color: Colors.grey,
              blurRadius: 3.0,
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: FlatButton(
          onPressed: _launchURL,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Container(
                      child: Image.asset(
                        imageURL,
                        width: 39,
                        height: 39,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          heading,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.display1,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          txt,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.display1,
                              color: Colors.grey,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
