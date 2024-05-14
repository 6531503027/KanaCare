import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:workworkwork/Quiz/Assess.dart';
import 'package:workworkwork/Quiz/Calm.dart';
import 'package:workworkwork/Quiz/MindEase.dart';
import 'package:workworkwork/Quiz/Mindful.dart';
import 'package:workworkwork/Quiz/Mornings.dart';
import 'package:workworkwork/Quiz/Overcome.dart';
import 'package:workworkwork/Quiz/Results/resultAssess.dart';
import 'package:workworkwork/Quiz/Results/resultCalm.dart';
import 'package:workworkwork/Quiz/Results/resultMindEase.dart';
import 'package:workworkwork/Quiz/Results/resultMindful.dart';
import 'package:workworkwork/Quiz/Results/resultMornings.dart';
import 'package:workworkwork/Quiz/Results/resultOvercome.dart';
import 'package:workworkwork/Quiz/Results/resultSleepHabit.dart';
import 'package:workworkwork/Quiz/Results/resultSleepSounds.dart';
import 'package:workworkwork/Quiz/SleepHabit.dart';
import 'package:workworkwork/Quiz/SleepSounds.dart';
import 'package:workworkwork/auth/auth.dart';
import 'package:workworkwork/auth/login_or_register.dart';
import 'package:workworkwork/pages/%20faq_page.dart';
import 'package:workworkwork/pages/Article/boredomPage.dart';
import 'package:workworkwork/pages/Article/sleepPage.dart';
import 'package:workworkwork/pages/Selfcare/Calm.dart';
import 'package:workworkwork/pages/Selfcare/assesspage.dart';
import 'package:workworkwork/pages/Selfcare/being_mindful.dart';
import 'package:workworkwork/pages/Selfcare/mind_to_ease.dart';
import 'package:workworkwork/pages/Selfcare/mornings.dart';
import 'package:workworkwork/pages/Selfcare/overcome.dart';
import 'package:workworkwork/pages/Selfcare/sleep.dart';
import 'package:workworkwork/pages/Selfcare/sleep_habit.dart';
import 'package:workworkwork/pages/certification.dart';
import 'package:workworkwork/pages/chat_page.dart';
import 'package:workworkwork/pages/home_page.dart';
import 'package:workworkwork/pages/profile_page.dart';
import 'package:workworkwork/pages/self-care_page.dart';
import 'package:workworkwork/theme/dark_mode.dart';
import 'package:workworkwork/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "AIzaSyBgnqkFjdis95GYlq0VHvOwUYLxn7ORZNE",
      appId: "1:831051865110:android:3289458076f034d53fa937",
      messagingSenderId: "831051865110",
      projectId: "catfish-d47dd",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/login_register_page': (context) => const LoginOrRegister(),
        '/home_page': (context) => const Homepage(),
        '/profile_page': (context) => ProfilePage(),
        '/ChatPage': (context) => const ChatPage(),
        '/SelfCarePage': (context) => SelfCarePage(),
        '/FaqPage': (context) => const FaqPage(),
        '/BoredomPage': (context) => const BoredomPage(),
        '/SleepPage': (context) => const SleepPage(),
        '/AssessPage': (context) => const AssessPage(),
        '/MindfulPage': (context) => const MindfulPage(),
        '/SleephabitPage': (context) => const SleephabitPage(),
        '/CalmPage': (context) => const CalmPage(),
        '/MindPage': (context) => const MindPage(),
        '/SurveyPage': (context) => SurveyPage(),
        '/SurveyPage1': (context) => SurveyPage1(),
        '/SurveyPage2': (context) => SurveyPage2(),
        '/SubAssessPage': (context) => SubAssessPage(),
        '/SubMindPage': (context) => SubMindPage(),
        '/SubSleephabitPage': (context) => SubSleephabitPage(),
        '/SubMindfulPage': (context) => SubMindfulPage(),
        '/SurveyPage3': (context) => SurveyPage3(),
        '/SurveyPage4': (context) => SurveyPage4(),
        '/SubCalmPage': (context) => SubCalmPage(),
        '/SubOvercomePage': (context) => SubOvercomePage(),
        '/SurveyPage5': (context) => SurveyPage5(),
        '/SubSleepPage': (context) => SubsleepPage(),
        '/SurveyPage6': (context) => SurveyPage6(),
        '/SubMorningsPage': (context) => SubMorningsPage(),
        '/SurveyPage7': (context) => SurveyPage7(),
        '/SleepsPage': (context) => const SleepsPage(),
        '/OvercomePage': (context) => const OvercomePage(),
        '/MorningsPage': (context) => const MorningsPage(),
        '/AuthPage': (context) => const AuthPage(),
        '/CERTIFICATIONPage': (context) => const CERTIFICATIONPage(),
      },
    );
  }
}
