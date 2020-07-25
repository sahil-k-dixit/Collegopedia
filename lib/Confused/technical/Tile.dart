import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tile extends StatelessWidget {
  String heading;
  String txt;
  Function onPress;
  Color colorBox;
  Tile({this.heading, this.txt, this.onPress, this.colorBox});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: 400,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            color: Color(0xFF4A5065),
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(3.0, 3.0),
                color: Colors.black54,
                blurRadius: 3.0,
                spreadRadius: 0,
              ),
            ]),
        child: ListTile(
          onTap: onPress,
          title: Text(
            heading,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.display1,
                color: Colors.white,
                fontSize: 16),
          ),
          subtitle: Text(
            txt,
            textAlign: TextAlign.left,
            style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.display1,
                color: Colors.grey,
                fontSize: 13),
          ),
        ),
//        child: Column(
//          //mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Text(
//                heading,
//                style: GoogleFonts.lato(
//                    textStyle: Theme.of(context).textTheme.display1,
//                    color: Colors.white,
//                    fontSize: 16),
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Container(
//                child: Text(
//                  txt,
//                  textAlign: TextAlign.left,
//                  style: GoogleFonts.lato(
//                      textStyle: Theme.of(context).textTheme.display1,
//                      color: Colors.white,
//                      fontSize: 13),
//                ),
//              ),
//            ),
//          ],
//        ),
      ),
    );
  }
}
