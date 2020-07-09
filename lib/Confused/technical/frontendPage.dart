import 'package:collegopedia/Confused/technical/Tile.dart';
import 'package:flutter/material.dart';

class FrontEndPage extends StatefulWidget {
  @override
  _FrontEndPageState createState() => _FrontEndPageState();
}

class _FrontEndPageState extends State<FrontEndPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Frontend Developer")),
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
                heading: 'Frontend Developer',
                txt:
                    'Front-end includes every aspect of a website or a web application that users can read, see or interact with. That means, everything '
                    'that a user can interact with directly — text, colours and styles, images, graphs and tables, buttons, colours, and navigation. '
                    ' \n\n '
                    'Also referred to as ‘client-side development’, front-end development mostly revolves around languages such as HTML, CSS and JavaScript '
                    'and other tools like frameworks and libraries such as React, Angular, and Vue.',
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    'How to become a Frontend Developer?',
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
                heading: 'Learn HTML',
                txt:
                    'HyperText Markup Language or HTML is one of the most popular markup languages out there. '
                    'Most web pages and applications are written using HTML.The best part is that you don’t need to be a computer science nerd to learn it. '
                    'You just need to know how to use a text editor and how to create, edit and save files. Really, it is that simple.',
              ),
              Tile(
                heading: 'Learn CSS',
                txt:
                    'Once you have learned HTML, the next step in your journey to becoming a front-end developer is learning Cascading Style Sheets or CSS.'
                    'Simply put, use HTML to build the webpage structure and CSS to design the way it looks and feels. You’ll be able to adjust everything '
                    'from the colour of the text, the background images, '
                    'to the way the web page looks on different devices.',
              ),
              Tile(
                heading: 'Learn JavaScript',
                txt:
                    'JavaScript is a programming language that is used to control the way a webpage behaves. Typically, '
                    'front-end developers use HTML to build the site structure, CSS to alter the style and layout, '
                    'and JavaScript to design the way interacts with a visitor. ',
              ),
              Tile(
                heading: 'Learn front-end frameworks',
                txt:
                    'Once you have learned HTML, CSS, and JavaScript, the next step is to learn front-end development frameworks. '
                    'In the purest sense, they are libraries of pre-written codes for certain standard functions and tasks. '
                    'You can use them to build everything from side panels, navigation bars, and much more. '
                    'Essentially, these code repositories should help you to develop your application faster. ',
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
