import 'package:collegopedia/Drawer/DrawerBarr.dart';
import 'package:collegopedia/richtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'About us',
        )),
      ),
      //backgroundColor: Color(0xFF1D1F2D),
      drawer: DrawerrBarr(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  'Our Mission',
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.display1,
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: SelectableText(
                        "Our mission is to deliver the information related to "
                        "the requirements of various industries and organisations "
                        "for the specific roles for which they are hiring candidates.\n"
                        "The purpose of our application is to simply make people aware "
                        "of the opportunities and help them to showcase their talent by "
                        "making the best use of resources available with us.\n"
                        "Every college "
                        "student has the potential to step in various renowned companies/form. "
                        "The only thing you need is just the right planning, resources, guidance "
                        "and motivation which we provide on our platform."
                        "\n ",
                        style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.display1,
                            color: Colors.white,
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: SelectableText(
                        "Feel free to write us at collegopedia955@gmail.com.",
                        style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.display1,
                            color: Colors.white,
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
//          Expanded(
//            flex: 1,
//            child: Container(
//              child: Text('Stay connected with Collegopedia. Our portal gives you an access to learning resources, '
//                  'discussions and assists with college planning and preparation.'),
//            ),
//          )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> onOpen(LinkableElement link) async {
  print('click');
  if (await canLaunch(link.url)) {
    await launch(link.url);
  } else {
    throw 'Could not launch $link';
  }
}
