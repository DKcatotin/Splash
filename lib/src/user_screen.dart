import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.asset(
          'assets/il.png', 
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}