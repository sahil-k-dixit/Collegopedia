import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MainTile extends StatelessWidget {
  _launchURL() async {
    //const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String heading;
  String txt;
  String url;
  Color colorBox;
  Function onPress;
  String imageURL;
  MainTile(
      {this.imageURL, this.txt, this.colorBox, this.heading, this.onPress});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 9, 40, 8),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF4A5065),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10), 
          boxShadow: [
            BoxShadow(
              offset: const Offset(3.0, 3.0),
              //color: Colors.grey,
              blurRadius: 3.0,
              spreadRadius: 0,
            ),
          ],
          // borderRadius: BorderRadius.circular(5),
        ),
        child: ListTile(
          onTap: onPress,
          leading: Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            width: 49,
            height: 49,
            decoration: BoxDecoration(color: colorBox,
                borderRadius: BorderRadius.circular(50),
                //shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(3.0, 3.0),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ),
                ]),
            child: Image.asset(
              imageURL,
              width: 39,
              height: 39,
            ),
          ),
          title: Text(
            heading,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.display1,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          subtitle: Text(
            txt,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.display1,
                color: Colors.grey,
                fontSize: 14),
          ),
          trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
        ),
//        child: FlatButton(
//          onPressed: onPress,
//          child: Padding(
//            padding: const EdgeInsets.all(10.0),
//            child: Row(
//              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              //crossAxisAlignment: CrossAxisAlignment.stretch,
//              children: <Widget>[
//                Expanded(
//                  flex: 1,
//                  child: SizedBox(
//                    width: 60,
//                    height: 60,
//                    child: Container(
//                      decoration: BoxDecoration(color: colorBox,
//                          //shape: BoxShape.circle,
//                          boxShadow: [
//                            BoxShadow(
//                              offset: const Offset(3.0, 3.0),
//                              blurRadius: 5.0,
//                              spreadRadius: 2.0,
//                            ),
//                          ]),
//                      child: Image.asset(
//                        url,
//                        width: 39,
//                        height: 39,
//                      ),
//                    ),
//                  ),
//                ),
//                Expanded(
//                  flex: 3,
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Text(
//                          heading,
//                          textAlign: TextAlign.center,
//                          style: GoogleFonts.lato(
//                              textStyle: Theme.of(context).textTheme.display1,
//                              color: Colors.white,
//                              fontWeight: FontWeight.bold,
//                              fontSize: 16),
//                        ),
//                        Text(
//                          txt,
//                          textAlign: TextAlign.center,
//                          style: GoogleFonts.lato(
//                              textStyle: Theme.of(context).textTheme.display1,
//                              color: Colors.grey,
//                              fontSize: 12),
//                        )
//                      ],
//                    ),
//                  ),
//                ),
//                Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios))
//              ],
//            ),
//          ),
//        ),
      ),
    );
  }
}
