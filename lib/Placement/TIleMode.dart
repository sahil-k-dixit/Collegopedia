import 'package:collegopedia/Placement/MessageModel.dart';
import 'package:collegopedia/globals.dart';
import 'package:collegopedia/readMore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TileDisplay extends StatelessWidget {
  MessageModel message;

  TileDisplay(this.message);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        //decoration: tileDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Text(
//                message.companyName,
//                style: TextStyle(fontWeight: FontWeight.bold),
//              ),
//            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 0.5,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Written by: ${message.name}",
                  style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.display1,
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.normal),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Mode: ${message.mode}",
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.display1,
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),),
            ),
            message.branch.isEmpty
                ? Text('')
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(" ${message.branch}",
                      style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.display1,
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),),
                  ),
            message.clg.isEmpty
                ? Text('')
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      " ${message.clg}",
                        style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.display1,
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Role: ${message.role}",
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.display1,
                    color: Colors.redAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Batch: ${message.batch}",
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.display1,
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "Intial rounds difficulty(Aptitude or Written coding test): ${message.apptitude}",
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.display1,
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Personal Interview difficulty: ${message.interview}",
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.display1,
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReadMoreText(
                message.description,
                trimLines: 2,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText: '...Show more',
                trimExpandedText: ' show less',
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.display1,
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
