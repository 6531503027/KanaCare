import 'package:flutter/material.dart';
import 'package:workworkwork/widgets/Exercises_tile.dart';

class SelfCarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SELF-CARE",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(66, 150, 160, 255),
              Color.fromARGB(215, 160, 247, 255),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Center(
                      child: Text(
                        'Exercise Packs',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20),
                    ExerciseTile(
                      icon: Icons.favorite,
                      exerciseName: 'Assess Yourself',
                      numberOfExercises: 7,
                      color: Color.fromARGB(255, 16, 163, 131),
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/catfish-d47dd.appspot.com/o/forest.jpg?alt=media&token=e845f9a7-523a-49c6-8cdb-b49548fe55a2',
                      onTap: () {
                        Navigator.pushNamed(context, '/AssessPage');
                      },
                    ),
                    ExerciseTile(
                      icon: Icons.psychology_alt,
                      exerciseName: 'Put Your Mind to Ease',
                      numberOfExercises: 7,
                      color: Color.fromARGB(255, 157, 86, 240),
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/catfish-d47dd.appspot.com/o/mind.jpg?alt=media&token=a07836bc-6d7a-47fd-9a02-8aa1e6f99f38',
                      onTap: () {
                        Navigator.pushNamed(context, '/MindPage');
                      },
                    ),
                    ExerciseTile(
                      icon: Icons.bedtime,
                      exerciseName: 'Sleep Habit Pack',
                      numberOfExercises: 7,
                      color: Color.fromARGB(255, 45, 194, 124),
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/catfish-d47dd.appspot.com/o/moons.jpg?alt=media&token=e1d6de38-3097-4845-b416-c7b15a48ba4a',
                      onTap: () {
                        Navigator.pushNamed(context, '/SleephabitPage');
                      },
                    ),
                    ExerciseTile(
                      icon: Icons.tips_and_updates,
                      exerciseName: 'For Being Mindful',
                      numberOfExercises: 5,
                      color: Color.fromARGB(255, 76, 108, 252),
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/catfish-d47dd.appspot.com/o/mind.jpg?alt=media&token=a07836bc-6d7a-47fd-9a02-8aa1e6f99f38',
                      onTap: () {
                        Navigator.pushNamed(context, '/MindfulPage');
                      },
                    ),
                    ExerciseTile(
                      icon: Icons.self_improvement,
                      exerciseName: 'Calm Your Mind',
                      numberOfExercises: 10,
                      color: Color.fromARGB(255, 204, 174, 253),
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/catfish-d47dd.appspot.com/o/flower.jpg?alt=media&token=3c463397-0dcb-4973-a78d-628f2a94ea6b',
                      onTap: () {
                        Navigator.pushNamed(context, '/CalmPage');
                      },
                    ),
                    ExerciseTile(
                      icon: Icons.hotel,
                      exerciseName: 'Sleep Sounds',
                      numberOfExercises: 4,
                      color: Color.fromARGB(255, 98, 179, 255),
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/catfish-d47dd.appspot.com/o/SleepWell.jpg?alt=media&token=5215ee01-408d-4fd1-8db3-c43ae2bd320a',
                      onTap: () {
                        Navigator.pushNamed(context, '/SleepsPage');
                      },
                    ),
                    ExerciseTile(
                      icon: Icons.light_mode,
                      exerciseName: 'For Fresh Mornings',
                      numberOfExercises: 5,
                      color: Color.fromARGB(255, 245, 163, 97),
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/catfish-d47dd.appspot.com/o/CureBoredom.jpg?alt=media&token=cbaa6c53-e54b-4171-9931-54d0546bd24f',
                      onTap: () {
                        Navigator.pushNamed(context, '/MorningsPage');
                      },
                    ),
                    ExerciseTile(
                      icon: Icons.mood,
                      exerciseName: 'Overcome Grief',
                      numberOfExercises: 8,
                      color: Color.fromARGB(255, 226, 236, 129),
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/catfish-d47dd.appspot.com/o/sunmini.jpg?alt=media&token=cf5f7f25-3c56-42d2-8a2e-2f17d7ef5078',
                      onTap: () {
                        Navigator.pushNamed(context, '/OvercomePage');
                      },
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
