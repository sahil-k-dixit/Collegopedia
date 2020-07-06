import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  final cities = ["Pune", "Mumbai", "Delhi"];
  final rcities = ["Pune", "Mumbai"];

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
        : cities.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          query = suggestion[index];
          showResults(context);
        },
        leading: Icon(Icons.location_city),
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
