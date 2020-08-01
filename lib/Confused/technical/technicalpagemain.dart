import 'package:collegopedia/Drawer/DrawerBarr.dart';
import 'package:collegopedia/UniversalTile.dart';
import 'package:flutter/material.dart';

class TechnicalPage extends StatefulWidget {
  @override
  _TechnicalPageState createState() => _TechnicalPageState();
}

class _TechnicalPageState extends State<TechnicalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Technical Section")),
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
                  padding: const EdgeInsets.fromLTRB(15,8,15,8),
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

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              'Technical Job means that jobs are related to your field Like IT Specialist, Software Engineering, '
                              'Quality Engineer, a Business banking executive, Network Administrator so they Used Some tech '
                              'knowledge on this that '
                              'why it called Tech Job. For Technical Jobs every day new technologies come in the market. \n\n '
                              'Technical job skills, also referred to as hard skills are specific talents and '
                              'expertise an individual possesses, helping him perform a certain task or job; '
                              'these skills differ from soft skills which are character and personality traits.',
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
                      'Role',
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
                  imageURL: 'images/TechnicalPage/front-end.png',
                  heading: 'Front-end Developer',
                  onPress: () => Navigator.pushNamed(context, '/front'),
                  colorBox: Colors.lime,
                  txt:
                      'A front-end web developer is responsible for implementing visual elements that users see and interact with in a web application. ',
                ),
                MainTile(
                  imageURL: 'images/TechnicalPage/backend.png',
                  heading: 'Backend Developer',
                  onPress: () => Navigator.pushNamed(context, '/back'),
                  colorBox: Colors.grey,
                  txt:
                      'A back-end developer is a type of programmer who creates the logical back-end and core computational logic of a website, software or information system.',
                ),
                MainTile(
                  imageURL: 'images/TechnicalPage/algorithm.png',
                  heading: 'Full Stack Developer',
                  colorBox: Colors.white,
                  onPress: () => Navigator.pushNamed(context, '/fullstack'),
                  txt:
                      'A full stack developer is a web developer or engineer who works with both the front and back ends of a website or application',
                ),
                MainTile(
                  heading: 'Mobile App Developer',
                  colorBox: Colors.red,
                  txt:
                      'Mobile app developer primary duty is to create, maintain and implement the source code to develop mobile apps',
                  imageURL: 'images/TechnicalPage/smartphone.png',
                  onPress: () => Navigator.pushNamed(context, '/mobile'),
                ),
//                MainTile(
//                  heading: 'Cybersecurity engineer',
//                  colorBox: Colors.black,
//                  txt:
//                      'Cyber security refers to the body of technologies, processes, and practices designed to '
//                      'protect networks, devices, programs, and data from attack, damage, or unauthorized access.',
//                  imageURL: 'images/TechnicalPage/cyber-security.png',
//                ),
//                MainTile(
//                  heading: 'Cloud engineer',
//                  colorBox: Colors.black,
//                  txt:
//                      'Cyber security refers to the body of technologies, processes, and practices designed to '
//                      'protect networks, devices, programs, and data from attack, damage, or unauthorized access.',
//                  imageURL: 'images/TechnicalPage/cloud-computing.png',
//                ),
//                MainTile(
//                  heading: 'DevOps engineer',
//                  colorBox: Colors.black,
//                  txt:
//                      'Cyber security refers to the body of technologies, processes, and practices designed to '
//                      'protect networks, devices, programs, and data from attack, damage, or unauthorized access.',
//                  imageURL: 'images/TechnicalPage/code.png',
//                ),
//                MainTile(
//                  heading: 'System engineer',
//                  colorBox: Colors.black,
//                  txt:
//                  'Cyber security refers to the body of technologies, processes, and practices designed to '
//                      'protect networks, devices, programs, and data from attack, damage, or unauthorized access.',
//                  imageURL: 'images/TechnicalPage/code.png',
//                ),
//                MainTile(
//                  heading: 'Game Developer',
//                  colorBox: Colors.black,
//                  txt:
//                  'Cyber security refers to the body of technologies, processes, and practices designed to '
//                      'protect networks, devices, programs, and data from attack, damage, or unauthorized access.',
//                  imageURL: 'images/TechnicalPage/code.png',
//                ),
//                MainTile(
//                  onPress: () => Navigator.pushNamed(context, '/quality'),
//                  colorBox: null,
//                  heading: 'Quality Assurance Analyst',
//                  imageURL: 'images/TechnicalPage/exam.png',
//                  txt:
//                      'The maintenance of a desired level of quality in a service or product, especially by means of attention to every stage of the process of delivery or production.',
//                ),
                Text(
                  'There are many more options too.. we will be updating as soon as possible thanks for your patience!!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontFamily: 'Times new Roman',
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
