import 'package:flutter/material.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          Image.asset(
            "assets/images/handshake.jpeg",
            fit: BoxFit.cover,
            height: 500,
            width: 400,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Goal-Specific Suggestions",
            style: TextStyle(
              fontSize: 25,
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
            "AI to gauge your current skills smart content recommendations based on progress",
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
