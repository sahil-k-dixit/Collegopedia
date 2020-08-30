import 'package:collegopedia/globals.dart';
import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Events',style: appBarHeaderTextStyle,),
        ),
      ),
    //  backgroundColor: Color(0xFF1D1F2D),
    );
  }
}
