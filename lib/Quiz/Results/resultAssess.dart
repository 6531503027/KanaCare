import 'package:flutter/material.dart';
import 'package:workworkwork/widgets/ArticleBox.dart';

class SubAssessPage extends StatefulWidget {
  const SubAssessPage({Key? key}) : super(key: key);

  @override
  _AssessPageState createState() => _AssessPageState();
}

class _AssessPageState extends State<SubAssessPage> {
  int _score = 0;
  int _totalQuestions = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    setState(() {
      _score = args['score'];
      _totalQuestions = args['totalQuestions'];
    });
  }

  String _getDescription(int score, int totalQuestions) {
    double percentage = (score / 35) * 100;

    if (percentage >= 70) {
      return 'You should see a doctor. To treat initial symptoms.';
    } else if (percentage >= 50) {
      return 'You should take a day off to go on vacation or have fun with your friends.';
    } else if (percentage >= 30) {
      return 'Good encouragement is encouragement from yourself.';
    } else {
      return 'The best pace is to step on one\'s own feet.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Assess Yourself",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 89, 248, 176),
              Color.fromARGB(255, 255, 255, 255),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 15),
                ArticleBox(
                  articleName: 'Assess Yourself',
                  color: Color.fromARGB(255, 16, 163, 131),
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/catfish-d47dd.appspot.com/o/forest.jpg?alt=media&token=e845f9a7-523a-49c6-8cdb-b49548fe55a2',
                  routeName: '',
                ),

                SizedBox(height: 15), // Add SizedBox for spacing
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Your score is $_score out of 35',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            _getDescription(_score, _totalQuestions),
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        if (_score / 35 * 100 < 70 && _score / 35 * 100 >= 50)
                          Column(
                            children: [
                              SizedBox(height: 10),
                              Icon(Icons.airplanemode_active,
                                  color: Colors.blue, size: 24),
                              Text(
                                'Recommendation: Take a break and go on a vacation!',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.blue),
                              ),
                            ],
                          ),
                        if (_score / 35 * 100 < 50 && _score / 35 * 100 >= 30)
                          Column(
                            children: [
                              SizedBox(height: 10),
                              Icon(Icons.thumb_up,
                                  color: Colors.green, size: 24),
                              Text(
                                'Good job! Keep up the good work.',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.green),
                              ),
                            ],
                          ),
                        if (_score / 35 * 100 < 30)
                          Column(
                            children: [
                              SizedBox(height: 10),
                              Icon(Icons.sentiment_dissatisfied,
                                  color: Colors.orange, size: 24),
                              Text(
                                'Recommendation: Take it easy and find ways to reduce stress.',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.orange),
                              ),
                            ],
                          ),
                        if (_score / 35 * 100 >= 70)
                          Column(
                            children: [
                              SizedBox(height: 10),
                              Icon(Icons.warning, color: Colors.red, size: 24),
                              Text(
                                'Warning: Your symptoms are severe. Please see a doctor immediately!',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.red),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                Spacer(), // Add Spacer to push the button to the bottom
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/AuthPage');
                        },
                        child: Text('Home',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
