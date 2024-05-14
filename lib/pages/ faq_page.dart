import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "F A Q",
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
              Color.fromARGB(66, 186, 193, 255),
              Color.fromARGB(215, 160, 247, 255),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('lib/neuf/faq.png'),
              ),
              // Introductory text
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Card(
                      margin: EdgeInsets.all(10),
                      elevation: 5, // Add elevation for shadow effect
                      color: Colors.white.withOpacity(
                          0.8), // Reduce opacity of background color
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "FAQ for the K A N A L C A R E application",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // ExpansionTile for Q&A
                    FaqTile(
                      question: "1. What is M E N T A L C A R E?",
                      answer:
                          "M E N T A L C A R E is an application designed to help users effectively take care of their own mental health and well-being. It provides learning, advice, and tools for managing a healthy life balance.",
                    ),
                    // Add more FaqTiles as needed
                    FaqTile(
                      question:
                          "2. What main functions are there in M E N T A L C A R E?",
                      answer:
                          "M E N T A L C A R E has the following main functions:\n"
                          "Lessons and videos on emotional and mental healing.\n"
                          "Lessons and videos on emotional and mental healing.\n"
                          "Community and support between users.",
                    ),
                    FaqTile(
                      question:
                          "3. How do I get started with M E N T A L C A R E?",
                      answer:
                          "You can download the M E N T A L C A R E application from the App Store or Google Play Store and install it on your device. After that, you can register and start using it immediately.",
                    ),
                    FaqTile(
                      question: "4. M E N T A L C A R E suitable for whom?",
                      answer:
                          "M E N T A L C A R E is suitable for anyone looking to take care of their mental health and wellbeing. Whether you are a person with mental health problems or not. Or even people who want to learn and develop themselves in terms of happiness.",
                    ),
                    FaqTile(
                      question:
                          "5. How can I join the community and share my experiences with other users?",
                      answer:
                          "Yes, you can join our community by creating an account and logging in. After that you can share your experiences, ask questions, or give advice to other users.",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FaqTile extends StatefulWidget {
  final String question;
  final String answer;

  const FaqTile({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  _FaqTileState createState() => _FaqTileState();
}

class _FaqTileState extends State<FaqTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        widget.question,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      children: [
        Card(
          margin: EdgeInsets.all(10),
          elevation: 5, // Add elevation for shadow effect
          color: Color.fromARGB(255, 0, 0, 0)
              .withOpacity(0.6), // Reduce opacity of background color
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              widget.answer,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
