import 'package:flutter/material.dart';

class SelfCareBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // Adjust width of each box
      height: 100, // Adjust height of each box
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        // Remove the boxShadow property
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.green,
            child: Icon(
              Icons.spa,
              size: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Self-Care',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
