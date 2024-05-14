import 'package:flutter/material.dart';
import 'package:workworkwork/widgets/ArticleBox.dart';

class SubCalmPage extends StatefulWidget {
  const SubCalmPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StudentsPageState createState() => _StudentsPageState();
}

class _StudentsPageState extends State<SubCalmPage> {
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
    double percentage = (score / 50) * 100;

    if (percentage >= 70) {
      return 'You should practice deep breathing exercises or meditation to calm your mind.';
    } else if (percentage >= 50) {
      return 'Consider taking a day off to relax and engage in activities that promote mental peace, like mindfulness or yoga.';
    } else if (percentage >= 30) {
      return 'Try incorporating short breaks throughout your day to practice mindfulness or simply take a few moments to breathe deeply and relax.';
    } else {
      return 'Start incorporating small habits into your daily routine to promote mental well-being, such as spending time in nature, journaling, or listening to calming music.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calm Your Mind",
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
              Color.fromARGB(255, 140, 154, 221),
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
                  articleName: 'Calm Your Mind',
                  color: Color.fromARGB(255, 140, 154, 221),
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/catfish-d47dd.appspot.com/o/flower.jpg?alt=media&token=3c463397-0dcb-4973-a78d-628f2a94ea6b',
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
                              Icon(Icons.beach_access,
                                  color: Colors.blue,
                                  size: 24), // Changed icon to beach_access
                              Text(
                                'Recommendation: Calm Your Mind and take a break!',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.blue),
                              ),
                            ],
                          ),
                        if (_score / 35 * 100 < 50 && _score / 35 * 100 >= 30)
                          Column(
                            children: [
                              SizedBox(height: 10),
                              Icon(Icons.sentiment_satisfied,
                                  color: Colors.green,
                                  size:
                                      24), // Changed icon to sentiment_satisfied
                              Text(
                                'Good job! Keep Calming Your Mind and continue the good work.',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.green),
                              ),
                            ],
                          ),
                        if (_score / 35 * 100 < 30)
                          Column(
                            children: [
                              SizedBox(height: 10),
                              Icon(Icons.spa,
                                  color: Colors.orange,
                                  size: 24), // Changed icon to spa
                              Text(
                                'Recommendation: Calm Your Mind and find ways to reduce stress.',
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
                                'Warning: Your symptoms are severe. Please Calm Your Mind and see a doctor immediately!',
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
                        child: Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
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
