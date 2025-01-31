import 'package:flutter/material.dart';
import 'package:path_forge/screens/bot_screen.dart';
import 'package:path_forge/screens/coding_challenges_screen.dart';
import 'package:path_forge/screens/hackathon_screen.dart';
import 'package:path_forge/screens/pair_programming_screen.dart';

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

            // Hackathons Card
            buildExploreCard(
              "Join Hackathons",
              "Compete, collaborate, and innovate in exciting coding hackathons!",
              "assets/images/hackathon-bg.png",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HackatonScreen(),
                  ),
                );
              },
            ),

            SizedBox(height: 40),

            // Pair Programming Card (with button)
            buildExploreCard(
              "Pair Programming",
              "Work together, learn faster, and write better code through collaboration!",
              "assets/images/pair-programming-bg.avif",
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

            // Daily Coding Challenges Card
            buildExploreCard(
              "Daily Coding Challenges",
              "Solve coding challenges daily to sharpen your problem-solving skills!",
              "assets/images/challenges-bg.jpeg",
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

            // Chat Bot Card
            buildExploreCard(
              "Chat with AI Bot",
              "Get instant coding help, explanations, and guidance from an AI-powered bot!",
              "assets/images/bot-image.png",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BotScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildExploreCard(String title, String description, String imagePath,
      {VoidCallback? onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.black.withOpacity(0.5), // Dark overlay
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 30),
                  if (onPressed != null) ...[
                    ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 2, color: Colors.white),
                        backgroundColor: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          "Explore Now",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
