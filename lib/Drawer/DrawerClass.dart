import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerBar extends StatelessWidget {
  DrawerBar(this.text, this.icon);

  final String text;
  Icon icon;

  //final String version;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20,0,20,0),
      child: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: Colors.grey, width: 1, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Colors.grey, width: 1, style: BorderStyle.solid))),
          child: FlatButton(
            onPressed: () {
              if (text == 'Home') {
                print('HOme');
                Navigator.pushNamed(context, '/home');
              } else if (text == 'Placement Section') {
                Navigator.pushNamed(context, '/placement');
              } else if (text.toLowerCase() == 'contest') {
                Navigator.pushNamed(context, '/contest');
              } else if (text.toLowerCase() == 'jobs') {
                Navigator.pushNamed(context, '/job');
              } else if(text == 'Discussion'){
                Navigator.pushNamed(context, '/discuss');
              }
              else if(text == 'Confused?')
                {
                  Navigator.pushNamed(context, '/confused');
                }
              else {
                Navigator.pushNamed(context, '/about');
              }
            },
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: icon,
                  flex: 1,
                ),
                Expanded(
                  child: Center(child: Text(text,textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.display1,
                       // color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),)),
                  flex: 3,
                ),
                Expanded(
                  child: Icon(Icons.arrow_forward_ios),
                  flex: 1,
                )
              ],
            ),
          )),
    );
  }
}
