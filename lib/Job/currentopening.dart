import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegopedia/Job/Message.dart';
import 'package:collegopedia/globals.dart';
import 'package:collegopedia/richtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final _firestore = Firestore.instance;

class JobOpening extends StatefulWidget {
  @override
  _JobOpeningState createState() => _JobOpeningState();
}

class _JobOpeningState extends State<JobOpening> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Job Opening')),
        ),
        backgroundColor: Color(0xFF1D1F2D),
        body: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('jobOpening').snapshots(),
              builder: (context, snap) {
                if (snap.hasData) {
                  //Map<dynamic, dynamic> data = snap.data.snapshot.value;
                  final messages = snap.data.documents.reversed;

                  List<Message> openList = [];
                  for (var message in messages) {
                    final msg = Message(
                        description: message.data['description'],
                        link: message.data['link']);
                    openList.add(msg);
                  }
                  return ListView.builder(
                    padding: EdgeInsets.fromLTRB(20, 10, 40, 20),
                    itemCount: openList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        // contentPadding: EdgeInsets.all(10),
                        title: Container(
                          decoration: tileDecoration,
                            child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Description:-'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichTextView(text: openList[index].description),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Apply :-'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichTextView(text: openList[index].link),
                            ),
                          ],
                        )),
                      );
                    },
                  );
                } else
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.redAccent),
                    ),
                  );
              }),
        ));
  }
}
