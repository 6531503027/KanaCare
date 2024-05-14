import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workworkwork/components/my_drawer.dart';
import 'package:workworkwork/widgets/ArticleBox.dart';
import 'package:workworkwork/widgets/Exercises_tile.dart';
import 'package:workworkwork/widgets/Selfcarelist.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    // Get the current user
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey, // Outline color
                width: 1.5, // Outline width
              ),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0, // No shadow
            title: Text(
              'K A N A C A R E',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.sos,
                  color: const Color.fromARGB(255, 255, 0, 0),
                  size: 35,
                ), // Icon color
                onPressed: () {
                  // Make the call to the specified number
                  _makePhoneCall('0650385015');
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                children: [
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " SELF-CARE",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  //View list

                  //Icon to the right
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Talk
                      Column(
                        children: [
                          SelfCareList(
                            selfcarelist: '💬',
                            routeName: '/ChatPage',
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Talk',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      // Remote
                      Column(
                        children: [
                          SelfCareList(
                            selfcarelist: '🙏',
                            routeName: '/AssessPage',
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Wellness',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      // Health
                      Column(
                        children: [
                          SelfCareList(
                            selfcarelist: '❤️',
                            routeName: '/MindfulPage',
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Health',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      // Stress
                      Column(
                        children: [
                          SelfCareList(
                            selfcarelist: '😤',
                            routeName: '/CalmPage',
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Stress',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 78, 78, 78),
                    width: 1,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25)
                      .add(EdgeInsets.only(top: 10)),
                  height: 500,
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [],
                        ),

                        //Listview of My pack
                        Expanded(
                          child: ListView(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'MY PACKS',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/SelfCarePage');
                                  },
                                  child: Text(
                                    'SEE ALL',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 224, 108, 13),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
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
                              icon: Icons.tips_and_updates,
                              exerciseName: 'Calm Your Mind',
                              numberOfExercises: 8,
                              color: Color.fromARGB(255, 140, 154, 221),
                              imageUrl:
                                  'https://firebasestorage.googleapis.com/v0/b/catfish-d47dd.appspot.com/o/flower.jpg?alt=media&token=3c463397-0dcb-4973-a78d-628f2a94ea6b',
                              onTap: () {
                                Navigator.pushNamed(context, '/CalmPage');
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'RECOMMENDED',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 15),
                                      ArticleBox(
                                        articleName:
                                            'learn about types of boredom & identify yours',
                                        color: Color.fromARGB(255, 95, 50, 114),
                                        imageUrl:
                                            'https://firebasestorage.googleapis.com/v0/b/catfish-d47dd.appspot.com/o/CureBoredom.jpg?alt=media&token=cbaa6c53-e54b-4171-9931-54d0546bd24f',
                                        routeName:
                                            '/BoredomPage', // Navigate to /Home when tapped
                                      ),
                                      SizedBox(
                                          height:
                                              10), // Add spacing between ArticleBoxes
                                      ArticleBox(
                                        articleName:
                                            'set a healthy sleep habit',
                                        color: Color.fromARGB(255, 42, 68, 138),
                                        imageUrl:
                                            'https://firebasestorage.googleapis.com/v0/b/catfish-d47dd.appspot.com/o/SleepWell.jpg?alt=media&token=5215ee01-408d-4fd1-8db3-c43ae2bd320a',
                                        routeName:
                                            '/SleepPage', // Navigate to /Home when tapped
                                      ),
                                      // Add more ArticleBox widgets as needed
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

void _makePhoneCall(String phoneNumber) async {
  if (await canLaunch('tel:$phoneNumber')) {
    await launch('tel:$phoneNumber');
  } else {
    throw 'Could not launch $phoneNumber';
  }
}
