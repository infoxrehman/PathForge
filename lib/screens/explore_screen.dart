import 'package:flutter/material.dart';
import 'package:path_forge/screens/bot_screen.dart';
import 'package:path_forge/screens/coding_challenges_screen.dart';
import 'package:path_forge/screens/hackathon_screen.dart';
import 'package:path_forge/screens/pair_programming_screen.dart';
import 'package:path_forge/widgets/explore_card.dart'; // Import the ExploreCard widget

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(
          "Explore more here!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto",
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            ExploreCard(
              title: "Daily Coding Challenges",
              description:
                  "Solve coding challenges daily to sharpen your problem-solving skills!",
              imagePath: "assets/images/challenges-bg.jpeg",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CodingChallengesScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 40),
            ExploreCard(
              title: "Chat with AI Bot",
              description:
                  "Get instant coding help, explanations, and guidance from an AI-powered bot!",
              imagePath: "assets/images/bot-image.png",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BotScreen()),
                );
              },
            ),
            SizedBox(height: 40),
            ExploreCard(
              title: "Pair Programming",
              description:
                  "Work together, learn faster, and write better code through collaboration!",
              imagePath: "assets/images/new-pair-programming.jpg",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PairProgrammingScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 40),
            ExploreCard(
              title: "Join Hackathons",
              description:
                  "Compete, collaborate, and innovate in exciting coding hackathons!",
              imagePath: "assets/images/hackathon-bg.png",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HackatonScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
