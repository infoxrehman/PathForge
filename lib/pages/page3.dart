import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          Image.asset(
            "assets/gif/progress_traking.gif",
            fit: BoxFit.cover,
            height: 500,
            width: 400,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Progress Traking and Milestone",
            style: TextStyle(
              fontSize: 23,
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
            "Visual indicators for completed milestones, We keep track for your progress!",
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
