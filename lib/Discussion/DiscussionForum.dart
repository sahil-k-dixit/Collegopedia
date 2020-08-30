import 'package:collegopedia/Discussion/DiscussionPageSeach/DiscussionSearchDelegate.dart';
import 'package:collegopedia/Discussion/QuestionTile.dart';
import 'package:collegopedia/Drawer/DrawerBarr.dart';
import 'package:collegopedia/globals.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DiscussionForum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF1D1F2D),
      appBar: AppBar(
        title: Center(child: Text("Discussion Forum",style: appBarHeaderTextStyle,)),
//        actions: <Widget>[
//          IconButton(
//              icon: Icon(
//                Icons.search,
//                color: Colors.white,
//              ),
//              onPressed: () {
//                showSearch(context: context, delegate: DiscussionSearch());
//              })
//        ],
      ),
      drawer: DrawerrBarr(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 100),
        child: QuestionStream(),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/question');
          },
          icon: Icon(Icons.add),
          label: Text("Got a Question?"),
        ),
      ),
    );
  }
}

class QuestionStream extends StatefulWidget {
  @override
  _QuestionStreamState createState() => _QuestionStreamState();
}

class _QuestionStreamState extends State<QuestionStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseDatabase().reference().child('Questions').onValue,
        builder: (context, snap) {
          if (snap.hasData &&
              !snap.hasError &&
              snap.data.snapshot.value != null) {
            Map<dynamic, dynamic> data = snap.data.snapshot.value;
            //print(data);
            questionList = [];
            data.forEach((index, data) {
              questionList.add(index);
            });
            // print(questionList);
            return ListView.builder(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              itemCount: questionList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  // contentPadding: EdgeInsets.all(10),
                  title: QuestionListTile(questionList[index]),
                );
              },
            );
          } else
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
              ),
            );
        });
  }
}
