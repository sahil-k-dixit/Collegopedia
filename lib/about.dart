import 'package:collegopedia/Drawer/DrawerBarr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
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
      backgroundColor: Color(0xFF1D1F2D),
      drawer: DrawerrBarr(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                child: Text('Our Mission'),
              ),
              Column(
                children: <Widget>[
                  Container(
                    child: SelectableText(
                        "Our mission is to deliver the information "
                        "about the needs and requirements of various industries and "
                        "organisations.The purpose of this application is to simply "
                        "make people aware of the opportunities and help them to showcase "
                        "their talent by making the best use of resources available with "
                        "us.Nowadays, it doesn't matter from which college you belong,"
                        " anyone can step in various renowned companies/firms. The only "
                        "thing you need is just the right planning, resources, guidance "
                        "and motivation which we provide on our platform."
                        "\n "),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () => print('object'),
                      child: Text(
                          "Feel free to write us at collegopedia955@gmail.com."),
                    ),
                  ),
                  Center(
                    child: SelectableLinkify(
                      onOpen: onOpen,
                      text:
                          "Made by https://cretezy.com\n\nMail: collegopedia955@gmail.com",
                    ),
                  ),
                ],
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
