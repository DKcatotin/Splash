import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.asset(
          'assets/mavi.jpg', 
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}