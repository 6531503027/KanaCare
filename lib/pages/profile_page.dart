import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Current logged in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // Text editing controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Error message
  String? _errorMessage;

  // Fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.email)
        .get();
  }

  // Update user details in Firestore
  void updateUserDetails(String name, String password) {
    // Reset error message
    setState(() {
      _errorMessage = null;
    });

    // Check if the new name is already used by another user
    FirebaseFirestore.instance
        .collection("users")
        .where('username', isEqualTo: name)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          _errorMessage = 'Username already in use';
        });
        return;
      }

      // Update the user's name
      FirebaseFirestore.instance
          .collection("users")
          .doc(currentUser!.email)
          .update({
        'username': name,
      }).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully')),
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update profile: $error')),
        );
      });

      // Update the user's password
      currentUser!.updatePassword(password).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password updated successfully')),
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update password: $error')),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PROFILE",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(218, 150, 160, 255),
              Color.fromARGB(215, 160, 247, 255),
            ],
          ),
        ),
        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: getUserDetails(),
          builder: (context, snapshot) {
            // Loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            // Error
            else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              Map<String, dynamic>? user = snapshot.data!.data();

              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme!.primary,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.all(25),
                        child: Icon(Icons.person, size: 64),
                      ),
                      SizedBox(height: 25),
                      Text(
                        user!['username'],
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        user['email'],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 50),
                      Text(
                        'Edit Details',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      MyTextBox(
                        text: 'Name',
                        sectionName: 'username',
                        initialValue: user['username'],
                        controller: _nameController,
                      ),
                      MyPasswordTextBox(
                        text: 'Password',
                        controller: _passwordController,
                      ),
                      MyPasswordTextBox(
                        text: 'Confirm Password',
                        controller: _confirmPasswordController,
                      ),
                      SizedBox(height: 16),
                      if (_errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            _errorMessage!,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ElevatedButton(
                        onPressed: () {
                          if (_passwordController.text.isEmpty) {
                            setState(() {
                              _errorMessage = 'Please enter your password';
                            });
                          } else if (_passwordController.text !=
                              _confirmPasswordController.text) {
                            setState(() {
                              _errorMessage = 'Passwords do not match';
                            });
                          } else {
                            updateUserDetails(
                                _nameController.text, _passwordController.text);
                          }
                        },
                        child: Text('Confirm'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: Text("No data"),
              );
            }
          },
        ),
      ),
    );
  }
}

// Widget for editable text box
class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final String initialValue;
  final TextEditingController controller;

  const MyTextBox({
    required this.text,
    required this.sectionName,
    required this.initialValue,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (initialValue.isNotEmpty) {
      controller.text = initialValue;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: text,
          border: OutlineInputBorder(),
        ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

// Widget for password text box
class MyPasswordTextBox extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const MyPasswordTextBox({
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: text,
          border: OutlineInputBorder(),
        ),
        obscureText: true,
      ),
    );
  }
}
