import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          Image.asset(
            "assets/gif/goal_sugesstion.avif",
            fit: BoxFit.cover,
            height: 500,
            width: 400,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Personalized Roadmap Generation",
            style: TextStyle(
              fontSize: 20,
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
            "Specialized Tailored step-by-step\n roadmap for domains like Web,\n AI/ML, App Development etc",
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
