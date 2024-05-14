import 'package:flutter/material.dart';

class SelfCareList extends StatelessWidget {
  final String selfcarelist;
  final String routeName;

  const SelfCareList({
    Key? key,
    required this.selfcarelist,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the desired page using the routeName provided
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 95, 181, 231),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(15),
        child: Center(
          child: Text(
            selfcarelist,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
      ),
    );
  }
}
