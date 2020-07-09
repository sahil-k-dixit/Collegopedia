import 'package:collegopedia/Placement/CompanySpecficList.dart';
import 'package:collegopedia/globals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanyListTile extends StatelessWidget {
  String companyName;

  CompanyListTile(this.companyName);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF4A5065),
          boxShadow: [
            BoxShadow(
              offset: const Offset(3.0, 3.0),
              //color: Colors.grey,
              blurRadius: 3.0,
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: FlatButton(
          onPressed: () {
//            Navigator.pushNamed(context, '/company',arguments: companyName);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CompanySpecificPlacementPage(companyName)));
          },
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Container(
                    child: Image.asset(
                      'images/company.png',
                      width: 39,
                      height: 39,
                    ),
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: Center(child: Text(companyName,textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.display1,
                      color: Colors.white,
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
        ),
      ),
    );
  }
}
