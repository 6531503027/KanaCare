import 'package:flutter/material.dart';

class SleepPage extends StatelessWidget {
  const SleepPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Healthy sleep habit ",
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
                child: Image.asset('lib/neuf/sleep.png'),
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
                          "Sleep Habit?\n\n"
                          "Establishing a healthy sleep habit involves developing a consistent routine and environment that promotes quality rest. Here's what it typically entails:",
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
                      question: "1. Consistent Sleep Schedule",
                      answer:
                          " Try to go to bed and wake up at the same time every day, even on weekends. This helps regulate your body's internal clock and improves the quality of your sleep.",
                    ),
                    // Add more FaqTiles as needed
                    FaqTile(
                      question: "2. Create a Relaxing Bedtime Routine:",
                      answer:
                          "Engage in calming activities before bed, such as reading, taking a warm bath, or practicing relaxation techniques like deep breathing or meditation. Avoid stimulating activities like watching TV or using electronic devices, as the blue light emitted can interfere with your ability to fall asleep.",
                    ),
                    FaqTile(
                      question: "3. Optimize Your Sleep Environment",
                      answer:
                          "Make sure your bedroom is conducive to sleep. Keep the room dark, quiet, and cool, and invest in a comfortable mattress and pillows. Consider using white noise machines or earplugs if you're sensitive to noise.",
                    ),
                    FaqTile(
                      question: "4. Limit Caffeine and Alcohol Intake",
                      answer:
                          "Avoid consuming caffeine and alcohol close to bedtime, as they can disrupt your sleep patterns. Instead, opt for herbal tea or warm milk, which can promote relaxation.",
                    ),
                    FaqTile(
                      question: "5. Exercise Regularly",
                      answer:
                          "Engaging in regular physical activity can help improve your sleep quality. Aim for at least 30 minutes of moderate exercise most days of the week, but avoid vigorous exercise close to bedtime, as it can be stimulating.",
                    ),
                    FaqTile(
                      question: "6. Watch Your Diet",
                      answer:
                          "Avoid heavy meals, spicy foods, and excessive liquids close to bedtime, as they can cause discomfort and disrupt your sleep. Opt for light, easily digestible snacks if you're hungry before bed.",
                    ),
                    FaqTile(
                      question: "7. Limit Screen Time",
                      answer:
                          "Reduce your exposure to screens (phones, tablets, computers, TVs) at least an hour before bedtime. The blue light emitted by these devices can interfere with the production of melatonin, a hormone that regulates sleep.",
                    ),
                    FaqTile(
                      question: "8. Manage Stress",
                      answer:
                          "Practice stress-reduction techniques such as mindfulness, yoga, or journaling to help calm your mind before bed. If you find yourself worrying about tomorrow's tasks, try making a to-do list before you go to bed to clear your mind.",
                    ),
                    FaqTile(
                      question: "9. Seek Professional Help if Needed",
                      answer:
                          " If you consistently struggle with sleep despite making these changes, consider consulting a healthcare professional. They can help identify underlying issues such as sleep disorders or medical conditions that may be affecting your ability to sleep well.",
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
