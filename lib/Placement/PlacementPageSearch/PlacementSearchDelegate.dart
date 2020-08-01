import 'package:collegopedia/Placement/CompanySpecficList.dart';
import 'package:collegopedia/globals.dart';
import 'package:flutter/material.dart';

class PlacementSearch extends SearchDelegate {
  // final cities = ["Pune", "Mumbai", "Delhi"];
  final rcities = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    // build action
    return [
      //Text(query),
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // icons
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return super.appBarTheme(context).copyWith(primaryColor: Colors.black);
  }

  @override
  Widget buildResults(BuildContext context) {
    // show result based on selection
    return Container(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestion = query.isEmpty
        ? rcities
        : companyList
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          query = suggestion[index];
//          Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) => CompanySpecificPlacementPage(query)));
//          showResults(context);
        },
        leading: Icon(Icons.business_center),
        title: RichText(
            text: TextSpan(
                text: suggestion[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                text: suggestion[index].substring(query.length),
                style: TextStyle(color: Colors.grey),
              )
            ])),
      ),
      itemCount: suggestion.length,
    );
    //return null;
  }
}
