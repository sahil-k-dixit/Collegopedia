import 'package:flutter/material.dart';

class HomePageTile extends StatelessWidget {
  String url;
  FlatButton fb;

  HomePageTile(this.url, this.fb);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border:
            Border.all(color: Colors.black, width: 2, style: BorderStyle.solid),
        image: DecorationImage(image: AssetImage(url), fit: BoxFit.fill),
      ),
      height: 300,
      width: 300,
      child: fb,
    );
  }
}
