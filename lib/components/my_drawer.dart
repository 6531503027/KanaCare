import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}); // Corrected constructor syntax

  void logout(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(66, 141, 151, 248),
              Color.fromARGB(172, 160, 247, 255),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // Drawer header
                DrawerHeader(
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset('lib/neuf/nunuef.png'),
                  ),
                ),
                const SizedBox(height: 25),
                // Home tile
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    title: Text("H O M E"),
                    onTap: () {
                      // This is already the home screen so just pop drawer
                      Navigator.pop(context);
                    },
                  ),
                ),
                // Profile tile
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    title: Text("P R O F I L E"),
                    onTap: () {
                      // This is already the home screen so just pop drawer
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/profile_page');
                    },
                  ),
                ),
                // Self-care tile
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.group,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    title: const Text("S E L F - C A R E"),
                    onTap: () {
                      // Push to setting page
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/SelfCarePage');
                    },
                  ),
                ),
                // Chat bot tile
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.chat,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    title: const Text("C E R T I F I C A T I O N"),
                    onTap: () {
                      // Push to setting page
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/CERTIFICATIONPage');
                    },
                  ),
                ),
                // faq tile
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.shape_line_rounded,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    title: const Text("F A Q"),
                    onTap: () {
                      // Push to setting page
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/FaqPage');
                    },
                  ),
                ),
              ],
            ),

            // Logout tile
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25),
              child: ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                title: Text("L O G O U T"),
                onTap: () {
                  logout(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
