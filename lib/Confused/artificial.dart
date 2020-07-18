import 'package:collegopedia/Confused/technical/Tile.dart';
import 'package:flutter/material.dart';

class ArtificialIntelligence extends StatefulWidget {
  @override
  _ArtificialIntelligenceState createState() => _ArtificialIntelligenceState();
}

class _ArtificialIntelligenceState extends State<ArtificialIntelligence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(" Artificial Intelligence Engineer ")),
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
                  heading: 'Artificial Intelligence',
                  txt:
                      'AI is a technique that enables machines to mimic human behavior. Artificial Intelligence '
                      'is the theory and development of computer systems able to '
                      'perform tasks normally requiring human intelligence, such as visual perception, '
                      'speech recognition, decision-making and translation between languages.\n If you ask me, AI is the '
                      'simulation of human intelligence done by machines programmed by us. '
                      'The machines need to learn how to reason and do some self-correction as needed along the way.'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    'How to Become an Artificial Intelligence Engineer ?',
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
                heading: 'Technical Skills',
                txt: 'Understanding and use of QA methodologies'
                    '\n Software Development Life Cycle'
                    '\n Design Patterns'
                    '\n Statistics and Mathematics'
                    '\n Machine Learning'
                    '\n Deep Learning & Neural Networks'
                    '\n Electronics, Robotics, and Instrumentation (Not a Mandate)',
              ),
              Tile(
                heading: 'Programming Languages (R/Java/Python/C++)',
                txt:
                    'One needs to be good at programming languages and not only '
                    'that it’s important to have a solid understanding of classes '
                    'and data structures.\n Sometimes Python won’t be enough. '
                    'Often you’ll encounter projects that need to leverage hardware for speed improvements. '
                    'Make sure you’re familiar with basic algorithms, as well as classes, memory management, and linking.',
              ),
              Tile(
                heading: 'Linear Algebra/Calculus/Statistics',
                txt:
                    'You’ll need to be intimately familiar with matrices, vectors, and matrix multiplication. '
                    'If you have an understanding of derivatives and integrals, you should be in the clear. '
                    'Statistics is going to come up a lot.\n At least make sure you’re familiar with Gaussian distributions, '
                    'means, and standard deviations.',
              ),
              Tile(
                heading: 'Applied Math and Algorithms',
                txt:
                    'Having a firm understanding of algorithm theory and knowing how the algorithm works are very important. '
                    'You will need to understand subjects such as Gradient Descent, Convex Optimization,'
                    ' Lagrange, Quadratic Programming, Partial Differential equation, and Summations.All this math might seem intimidating at '
                    'first if you’ve been away from it for a while. '
                    'Yes, Machine Learning and Artificial Intelligence is much more math-intensive than something like front-end development.',
              ),
              Tile(
                heading: 'Neural Network Architectures',
                txt:
                    'We need Machine Learning for tasks that are too complex for humans to code directly, i.e. '
                    'tasks that are so complex that it is impractical. Neural networks have been by far the most accurate '
                    'way of approaching many problems,like Translation, Speech Recognition, and Image Classification, '
                    'which plays a very important role in the AI department.',
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
