import 'package:collegopedia/Drawer/DrawerBarr.dart';
import 'package:collegopedia/Placement/CompanyList.dart';
import 'package:collegopedia/Placement/PlacementPageSearch/PlacementSearchDelegate.dart';
import 'package:collegopedia/Placement/add_your_experience_page.dart';
import 'package:collegopedia/globals.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class PlacementPage extends StatefulWidget {
  @override
  _PlacementPageState createState() => _PlacementPageState();
}

class _PlacementPageState extends State<PlacementPage> {
  //DatabaseReference _messagesRef;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final dbRef = FirebaseDatabase.instance.reference().child("Placements");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1F2D),
      appBar: AppBar(
        backgroundColor: Color(0xFF0E0F1B),
        title: Center(child: Text("List of Companies")),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                showSearch(context: context, delegate: PlacementSearch());
              })
        ],
      ),
      drawer: DrawerrBarr(),
      body: StreamBuilder(
          stream: FirebaseDatabase().reference().child('Placements').onValue,
          builder: (context, snap) {
            if (snap.hasData &&
                !snap.hasError &&
                snap.data.snapshot.value != null) {
              Map<dynamic, dynamic> data = snap.data.snapshot.value;
              companyList = [];
              data.forEach((index, data) {
                companyList.add(index);
              });
              return ListView.builder(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                itemCount: companyList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    // contentPadding: EdgeInsets.all(10),
                    title: CompanyListTile(companyList[index]),
                  );
                },
              );
            } else
              return Center(child: Text("No data"));
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddYourExperience()));
        },
        label: Text("Add your experience"),
        icon: Icon(Icons.exposure_plus_1),
      ),
    );
  }
}

// Model Class

// TileMode
