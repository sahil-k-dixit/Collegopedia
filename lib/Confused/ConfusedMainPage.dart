import 'package:collegopedia/Drawer/DrawerBarr.dart';
import 'package:collegopedia/UniversalTile.dart';
import 'package:flutter/material.dart';

class ConfusedMainPage extends StatefulWidget {
  @override
  _ConfusedMainPageState createState() => _ConfusedMainPageState();
}

class _ConfusedMainPageState extends State<ConfusedMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Confused")),
          backgroundColor: Colors.black,
        ),
        drawer: DrawerrBarr(),
        backgroundColor: Color(0xFF1D1F2D),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // height: 400,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                            color: Colors.white,
                            width: 2,
                            style: BorderStyle.solid)),
                    child: Column(
                      children: <Widget>[
                        Text(
                          ' Confused?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontStyle: FontStyle.italic),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              'Its okay if you are confused it is very common. Tells us your area of interest so that we can help you better!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Times new Roman',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      'Area of Interest',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Times new Roman',
                      ),
                    ),
                  ),
                ),
                MainTile(
                  imageURL: 'images/ConfusedPage/technical.png',
                  heading: 'Technical',
                  onPress: () => Navigator.pushNamed(context, '/tech'),
                  colorBox: Colors.black,
                  txt:
                      'Technical Job means that jobs are related to your field Like IT Specialist, Software Engineering, Quality Engineer.',
                ),
                MainTile(
                  imageURL: 'images/ConfusedPage/growth.png',
                  heading: 'Business Development',
                  colorBox: Colors.black,
                  onPress: null,
                  txt:
                      'The objectives include branding, expansion in markets, new user acquisition, and awareness. ',
                ),
                MainTile(
                  txt:
                      'Artificial intelligence (AI) is the ability of a computer program or a machine to think and learn.',
                  imageURL: 'images/ConfusedPage/brain.png',
                  heading: 'Artificial Intelligence',
                  colorBox: Colors.black,
                ),
                MainTile(
                  imageURL: 'images/ConfusedPage/report.png',
                  heading: 'Data Science',
                  txt:
                      'Data science is the study of data. It involves developing methods of recording, storing, and analyzing data to effectively extract useful information.',
                  colorBox: Colors.black,
                ),
                MainTile(
                  heading: 'UX Designer',
                  colorBox: null,
                  onPress: null,
                  txt:
                      'UX design focuses on the interaction between real human users (like you and me) and everyday products and services, '
                      'such as websites, apps, and even coffee machines.',
                  imageURL: 'images/ConfusedPage/design.png',
                )
              ],
            ),
          ),
        ));
  }
}
