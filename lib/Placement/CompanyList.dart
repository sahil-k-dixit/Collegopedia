import 'package:collegopedia/Placement/CompanySpecficList.dart';
import 'package:collegopedia/globals.dart';
import 'package:flutter/material.dart';

class CompanyListTile extends StatelessWidget {
  String companyName;

  CompanyListTile(this.companyName);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: tileDecoration,
        child: FlatButton(
          onPressed: () {
//            Navigator.pushNamed(context, '/company',arguments: companyName);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CompanySpecificPlacementPage(companyName)));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              companyName,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
