import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CERTIFICATIONPage extends StatelessWidget {
  const CERTIFICATIONPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "C E R T I F I C A T I O N",
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
                child: Image.asset('lib/neuf/certificate.png'),
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
                          "CERTIFICATION for application",
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
                      question: "มูลนิธิหมอชาวบ้าน",
                      answer: "https://www.doctor.or.th/ask/list",
                    ),
                    // Add more FaqTiles as needed
                    FaqTile(
                      question: "กรมสุขภาพจิต",
                      answer:
                          "https://dmh.go.th/test/thaihapnew/asheet.asp?qid=1",
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

class FaqTile extends StatelessWidget {
  final String question;
  final String answer;

  const FaqTile({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      children: [
        GestureDetector(
          onTap: () {
            launch(answer); // Launch the URL when tapped
          },
          child: Card(
            margin: EdgeInsets.all(10),
            elevation: 5, // Add elevation for shadow effect
            color: Color.fromARGB(255, 0, 0, 0)
                .withOpacity(0.6), // Reduce opacity of background color
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                answer,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
