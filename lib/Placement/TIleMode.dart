import 'package:collegopedia/Placement/MessageModel.dart';
import 'package:collegopedia/globals.dart';
import 'package:collegopedia/readMore.dart';
import 'package:flutter/material.dart';

class TileDisplay extends StatelessWidget {
  MessageModel message;

  TileDisplay(this.message);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: tileDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message.companyName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Written by: ${message.name}",
                  style: TextStyle(fontStyle: FontStyle.italic)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Mode: ${message.mode}",
                  style: TextStyle(fontStyle: FontStyle.italic)),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
