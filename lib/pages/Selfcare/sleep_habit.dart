import 'package:flutter/material.dart';
import 'package:workworkwork/widgets/ArticleBox.dart';

class SleephabitPage extends StatelessWidget {
  const SleephabitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sleep Habit Pack",
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
              Color.fromARGB(255, 123, 255, 141),
              Color.fromARGB(255, 160, 247, 255),
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
                  articleName: 'Sleep Habit Pack',
                  color: Color.fromARGB(255, 45, 194, 124),
                  imageUrl:
                      'https://firebasestorage.googleapis.com/v0/b/catfish-d47dd.appspot.com/o/moons.jpg?alt=media&token=e1d6de38-3097-4845-b416-c7b15a48ba4a',
                  routeName: '',
                ),

                SizedBox(height: 15), // Add SizedBox for spacing
                Container(
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Text(
                    "Sleep Habit Pack\n\n"
                    "comprehensive set of practices aimed at improving sleep quality. It includes various techniques and strategies to promote better sleep hygiene and address common sleep problems.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),

                SizedBox(height: 30), // Add SizedBox for spacing
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Text(
                    "If you're ready, press the button.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
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
                          Navigator.pushNamed(context, '/SurveyPage2');
                        },
                        child: Text(
                          'Start',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
