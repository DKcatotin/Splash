import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.asset(
          'assets/bie.webp', 
          width: 120,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}