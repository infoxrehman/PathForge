import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          Image.asset(
            "assets/gif/onboard_bot.gif",
            fit: BoxFit.cover,
            height: 500,
            width: 500,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Welcome!",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade900,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Subtitle with improved style
          Text(
            "Learn and Grow with PathForge\n Together, let's forge your path to success!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
              fontFamily: 'Roboto',
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
