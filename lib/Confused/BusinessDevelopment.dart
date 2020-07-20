import 'package:collegopedia/Confused/technical/Tile.dart';
import 'package:flutter/material.dart';

class BusinessDevelopmentPage extends StatefulWidget {
  @override
  _BusinessDevelopmentPageState createState() =>
      _BusinessDevelopmentPageState();
}

class _BusinessDevelopmentPageState extends State<BusinessDevelopmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Business Development")),
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
                  heading: 'What is Business Development?',
                  txt:
                      'Business Development acts as a discussion between the Marketing and '
                      'Sales teams. The role will be to seek new business opportunities '
                      'by contacting and developing relationships with potential customers.'
                      'Now the question comes why they need engineers? Is this a good opportunity?'
                      ' What is the future scope? And the list of questions goes on and on and on….'),
              Tile(
                heading: 'Role',
                txt:
                    'The role can be majority divided into 2 parts for engineers :- \n '
                    '1. The role of business development is mostly related to sales '
                    'and marketing for opportunities which do not need any engineering background knowledge.\n'
                    'An engineer can be recruited for this role for the companies which do not work in the engineering '
                    'domain and want people purely for marketing and sales purposes. Eg of such companies are byjus jaro '
                    'etc.tye major roles here are direct client acquisition through marketing and sales, advertising, etc. '
                    'That is this type of profile needs no engineering knowledge at all or to a very minimum extend.these '
                    'are well-paying jobs with ample growth opportunities. \n '
                    '2. The other type of opportunity presented to engineers in the business development'
                    ' profile is related to there engineering domains. For the IT field, you need to have '
                    'the knowledge of computer fields used by your company for a better explanation to the client. '
                    'These are and should be more preferred by the engineers if they do not wish to work in a purely '
                    'core side but still want to have a connection with there engineering knowledge. \n\n',
              ),
              Tile(
                heading: 'Skills Required?',
                txt:
                    'Basic skills requirement non-engineering background business development role are:-\n '
                    ' Good communication skills both written and verbal \n '
                    'Good presentation skills \n '
                    'Problem-solving ability \n'
                    'Teamwork\n'
                    'Performing well under pressure \n '
                    'And the most important of them all a passion for sales and marketing. \n'
                    'Good convincing skills \n\n'
                    'Technical Skills:-'
                    'Microsoft Office \n '
                    'Microsoft Visio \n'
                    'Software Design Tools\n '
                    'SQL Queries\n '
                    'Business Process Models\n ',
              ),
              Tile(
                heading: 'Day-to-day Challenges',
                txt:
                    'Qualify leads from marketing campaigns as sales opportunities\n '
                    'Contact potential clients through cold calls and emails \n '
                    'Present your company to potential clients \n '
                    'Identify client needs and suggest appropriate products/services\n '
                    'Customize product solutions to increase customer satisfaction\n '
                    'Build long-term trusting relationships with clients\n '
                    'Proactively seek new business opportunities in the market \n '
                    'Set up meetings or calls between (prospective) clients and accounting executive.',
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
