import 'package:flutter/material.dart';

class DrawerBar extends StatelessWidget {
  DrawerBar(this.text, this.icon);

  final String text;
  Icon icon;

  //final String version;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: Colors.blue,
        shape: BoxShape.rectangle,
      ),
      child: ListTile(
        leading: icon,
        onTap: () {
          if (text == 'Home') {
            print('HOme');
            Navigator.pushNamed(context, '/home');
          } else if (text == 'Placement Section') {
            Navigator.pushNamed(context, '/placement');
          } else if (text.toLowerCase() == 'contest') {
            Navigator.pushNamed(context, '/contest');
          } else if (text.toLowerCase() == 'jobs') {
            Navigator.pushNamed(context, '/job');
          } else {
            Navigator.pushNamed(context, '/discuss');
          }
        },
        title: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 15),
        )),
      ),
    );
  }
}
