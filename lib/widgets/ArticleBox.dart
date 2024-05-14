import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';

class ArticleBox extends StatelessWidget {
  final String articleName;
  final Color color;
  final String imageUrl; // URL of the image in Firebase Storage
  final String routeName; // Route name for navigation

  const ArticleBox({
    Key? key,
    required this.articleName,
    required this.color,
    required this.imageUrl,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Push to the specified route name when tapped
        Navigator.pushNamed(context, routeName);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          height: 200, // Increased height
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color.withOpacity(0.7), // Adjust overlay color and opacity
            ),
            child: Align(
              alignment: Alignment.bottomLeft, // Align content to bottom left
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  articleName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
