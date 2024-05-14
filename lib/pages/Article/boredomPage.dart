import 'package:flutter/material.dart';

class BoredomPage extends StatelessWidget {
  const BoredomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Boredom & Identify",
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
                child: Image.asset('lib/neuf/loveurself.png'),
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
                          "Boredom & identify yours?\n\n"
                          "Boredom can manifest in various ways, and researchers have identified different types or dimensions of boredom based on the underlying experiences and emotions associated with it. Here are some common types of boredom:",
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
                      question: "1. Indifferent Boredom",
                      answer:
                          "This type of boredom involves feeling relaxed and indifferent. You may be disengaged and unmotivated to pursue any activity.",
                    ),
                    // Add more FaqTiles as needed
                    FaqTile(
                      question: "2. Calibrating Boredom",
                      answer:
                          "Here, you might feel restless and actively seeking out something to do, but nothing seems quite satisfying or engaging enough.",
                    ),
                    FaqTile(
                      question: "3. Searching Boredom",
                      answer:
                          "This type of boredom involves a strong desire for stimulation and a general openness to change activities. You may feel like you're actively seeking something to capture your interest.",
                    ),
                    FaqTile(
                      question: "4. Reactant Boredom",
                      answer:
                          "This is characterized by feeling angry, frustrated, or agitated due to being bored. It's a more negative and intense form of boredom.",
                    ),
                    FaqTile(
                      question: "5. Apathetic Boredom",
                      answer:
                          "In this state, you might feel tired, indifferent, and lacking in motivation or interest. It's a sense of being emotionally drained.",
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
          fontSize: 18,
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
