import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'For Being Mindful',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SurveyPage3(),
      onGenerateRoute: (settings) {
        if (settings.name == '/result') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => ResultPage(
              score: args['score'],
              totalQuestions: args['totalQuestions'],
            ),
          );
        }
        return null;
      },
    );
  }
}

class SurveyPage3 extends StatefulWidget {
  const SurveyPage3({Key? key}) : super(key: key);

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage3> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Question> _questions = [];
  List<int> _selectedOptions = [];

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    final questionsSnapshot = await _firestore.collection('questions4').get();
    _questions = questionsSnapshot.docs
        .map((doc) => Question.fromMap(doc.data()))
        .toList();
    _selectedOptions = List<int>.generate(_questions.length, (index) => 0);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "For Being Mindful",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 76, 108, 252),
              Color.fromARGB(255, 255, 255, 255),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20.0),
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.black.withOpacity(0.5), width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0), // add some padding
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              _questions[index].question,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0; i < 5; i++)
                                  RadioListTile(
                                    title: Text(
                                      _getOptionText(i + 1),
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    value: i + 1,
                                    groupValue: _selectedOptions[index],
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedOptions[index] = value as int;
                                      });
                                    },
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ));
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: _canSubmit
                    ? () {
                        int totalScore =
                            _selectedOptions.fold(0, (a, b) => a + b);
                        Navigator.pushNamed(
                          context,
                          '/SubMindfulPage',
                          arguments: {
                            'score': totalScore,
                            'totalQuestions': _questions.length,
                          },
                        );
                      }
                    : null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(_canSubmit
                      ? Colors.blue
                      : Colors.grey), // Button background color
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white), // Button text color
                ),
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool get _canSubmit {
    return _selectedOptions.every((option) => option != 0);
  }

  String _getOptionText(int optionNumber) {
    switch (optionNumber) {
      case 1:
        return 'Excellent';
      case 2:
        return 'Nice';
      case 3:
        return 'Normal';
      case 4:
        return 'Bad';
      case 5:
        return 'Terrible';
      default:
        return 'Unknown option';
    }
  }
}

class Question {
  final String question;

  Question({required this.question});

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      question: map['question'] ?? '',
    );
  }
}

class ResultPage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultPage({
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score: $score',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Total Questions: $totalQuestions',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
