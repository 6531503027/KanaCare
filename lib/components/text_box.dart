import 'package:flutter/material.dart';

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
