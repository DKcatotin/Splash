import 'package:flutter/material.dart';
import 'package:splash/src/favorite_screen.dart';
import 'package:splash/src/home_screen.dart';
import 'package:splash/src/navigation_screen.dart';
import 'package:splash/src/search_screen.dart';
import 'package:splash/src/splash_screen.dart';
import 'package:splash/src/user_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/navigation': (context) => const NavigationScreen(),
        '/home': (context) => const HomeScreen(),
        '/favorite': (context) => const FavoriteScreen(),
        '/search': (context) => const SearchScreen(),
        '/user': (context) => const UserScreen(),
      },
    );
  }
}
