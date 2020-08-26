import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegopedia/Job/Message.dart';
import 'package:collegopedia/globals.dart';
import 'package:collegopedia/richtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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
          title: Center(child: Text('Current Openings',style: appBarHeaderTextStyle,)),
        ),
        backgroundColor: Color(0xFF1D1F2D),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/addjob');
          },
          label: Text("Add Job Opening"),
          icon: Icon(Icons.exposure_plus_1),
        ),
        body: SafeArea(
          child: StreamBuilder(
              stream:
                  FirebaseDatabase().reference().child('jobOpening').onValue,
              builder: (context, snap) {
                List<Message> openList = [];
                if (snap.hasData &&
                    !snap.hasError &&
                    snap.data.snapshot.value != null) {
                  Map<dynamic, dynamic> data = snap.data.snapshot.value;
                  openList = [];
                  data.forEach((index, data) {
                    final message = Message(
                        description: data["description"], link: data["link"],name: data['name'],title: data["title"]);
                    openList.add(message);
                  });
                  return ListView.builder(
                    padding: EdgeInsets.fromLTRB(20, 10, 40, 80),
                    itemCount: openList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        // contentPadding: EdgeInsets.all(10),
                        title: Container(
                            // decoration: tileDecoration,
                            child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                openList[index].name,
                                style: textStyle.copyWith(fontSize: 14,color: Colors.red,fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                openList[index].title,
                                style: textStyle.copyWith(fontSize: 13,color: Colors.white,fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,8,8,0),
                              child: Text(
                                'Description:-',
                                style: textStyle.copyWith(fontSize: 13),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,8,8,0),
                              child: RichTextView(
                                text: openList[index].description,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,8,8,0),
                              child: Text('Apply :-',style: textStyle.copyWith(
                                fontSize: 13
                              ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: RichTextView(text: openList[index].link),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.0),
                              child: Container(
                                height: 0.5,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.grey,
                              ),
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
