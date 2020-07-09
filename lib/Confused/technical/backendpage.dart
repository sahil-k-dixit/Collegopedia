import 'package:collegopedia/Confused/technical/Tile.dart';
import 'package:flutter/material.dart';

class BackEndPage extends StatefulWidget {
  @override
  _BackEndPageState createState() => _BackEndPageState();
}

class _BackEndPageState extends State<BackEndPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Backend Developer")),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Color(0xFF0E0F1B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Tile(
                  heading: 'Backend Developer',
                  txt:
                      'Backend developers are responsible for using programming languages to create the code which actually makes web applications '
                      'function the way they’re supposed to. The code that these developers write runs on the webserver. In addition to writing backend code, '
                      'such developers are also responsible for developing APIs that are used by the mobile version of such web applications. '
                      ' \n\n '),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    'How to become a Backend Developer?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Times new Roman',
                    ),
                  ),
                ),
              ),
              Tile(
                heading:
                    'Be well versed with the basics of Data Structures & Algorithm',
                txt:
                    'Most of the web developers skip this step and move forward to learning frameworks.'
                    ' However, it is always better to know the data structure and algorithm basics. '
                    'Though not in-depth, you must have a basic idea about the process. You should revise basic '
                    'Data Structures and Algorithm Stack, Queue, Linked List, '
                    'Tree, Graph, Hashing, Sorting & Searching Algorithms and other core concepts of programming.',
              ),
              Tile(
                heading: 'Development Languages',
                txt:
                    'Backend engineer should know at least one server-side programming languages like Java, Python, Ruby, . Net etc.',
              ),
              Tile(
                heading: 'Database and cache',
                txt:
                    'Knowledge of various DBMS technology is another important need of backend developer. MySQL, MongoDB, Oracle, SQLServer, Redis are widely used for this purpose. Knowledge of caching mechanisms like varnish, Memcached, Redis is a plus.',
              ),
              Tile(
                heading: 'Server',
                txt:
                    'Exposure to handling Apache, Nginx, IIS servers, Microsoft IIS is desirable. A good background in Linux helps tremendously in administering servers.',
              ),
              Tile(
                heading: 'API (REST & SOAP):',
                txt:
                    'Knowledge of web services or API is also important for full stack developers. Knowledge of creations and consumption of REST and SOAP services is desirable.',
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                          color: Colors.grey,
                          width: 2,
                          style: BorderStyle.solid)),
                  child: FlatButton(
                    onPressed: () => Navigator.pushNamed(context, '/home'),
                    child: Text(
                      'Check out other sections to prepare and apply for jobs and much more...  Click here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontFamily: 'Times new Roman',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
