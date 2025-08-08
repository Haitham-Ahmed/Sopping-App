import 'package:flutter/material.dart';
import 'package:shopping_app/shopping_home_screen.dart';
import 'package:shopping_app/sign_in_screen.dart';
import 'package:shopping_app/sign_up_screen.dart';
import 'package:shopping_app/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/signup': (context) => const SignUpScreen(),  
        '/signin': (context) => const SignInScreen(),
        '/home': (context) => const ShoppingHomeScreen(),   
      },
    );
  }
}