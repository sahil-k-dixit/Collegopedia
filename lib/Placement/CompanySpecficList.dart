import 'package:collegopedia/DataSearch/DataSearch.dart';
import 'package:collegopedia/Drawer/DrawerBarr.dart';
import 'package:collegopedia/Placement/MessageModel.dart';
import 'package:collegopedia/Placement/TIleMode.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CompanySpecificPlacementPage extends StatefulWidget {
  String s;

  CompanySpecificPlacementPage(this.s);

  @override
  _CompanySpecificPlacementPageState createState() =>
      _CompanySpecificPlacementPageState();
}

class _CompanySpecificPlacementPageState
    extends State<CompanySpecificPlacementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1F2D),
      drawer: DrawerrBarr(),
      appBar: AppBar(
        title: Text("Placement Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 70),
        child: StreamBuilder(
            stream: FirebaseDatabase()
                .reference()
                .child('Placements')
                .child(widget.s)
                .orderByChild('created_at')
                .onValue,
            builder: (context, snap) {
              if (snap.hasData &&
                  !snap.hasError &&
                  snap.data.snapshot.value != null) {
                Map<dynamic, dynamic> data = snap.data.snapshot.value;
                List<MessageModel> listOfMessage = [];
                print(data.toString());
                data.forEach((index, data) {
                  MessageModel m = MessageModel(widget.s, data['name'],
                      data['description'], data["mode"]);
                  listOfMessage.add(m);
                });

                print(listOfMessage.length);

                return ListView.builder(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  itemCount: listOfMessage.length,
                  itemBuilder: (context, index) {
                    return ListTile(
// contentPadding: EdgeInsets.all(10),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
//crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[TileDisplay(listOfMessage[index])],
                      ),
                    );
                  },
                );
              } else
                return Center(child: Text("No data"));
            }),
      ),
    );
  }
}
