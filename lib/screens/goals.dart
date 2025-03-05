import 'package:flutter/material.dart';
import 'package:path_forge/auth/login_page.dart';
import 'package:path_forge/screens/custom_roadmap_screen.dart';
import 'package:path_forge/utils/goals_data.dart';
import 'package:path_forge/widgets/roadmap_card.dart';

class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  final List<Map<String, dynamic>> _roadmapCards = [
    {
      'title': "App Development",
      'description': "Learn Flutter step by step to build amazing apps.",
      'icon': Icons.flutter_dash,
      'screen': const AppDevelopmentScreen(),
    },
    {
      'title': "Web Development",
      'description': "Master HTML, CSS, and JavaScript for modern web.",
      'icon': Icons.web,
      'screen': const WebDevelopmentScreen(),
    },
    {
      'title': "Machine Learning",
      'description': "Dive into ML concepts and real-world applications.",
      'icon': Icons.memory,
      'screen': const MachineLearningScreen(),
    },
    {
      'title': "Data Science",
      'description': "Learn data analysis and visualization techniques.",
      'icon': Icons.bar_chart,
      'screen': const DataScienceScreen(),
    },
    {
      'title': "Artificial Intelligence",
      'description': "Explore APIs, databases, and server-side programming.",
      'icon': Icons.storage,
      'screen': const ArtificialIntelligenceScreen(),
    },
    {
      'title': "Cloud Computing",
      'description': "Understand Cloud computing",
      'icon': Icons.cloud,
      'screen': const CloudComputingScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
<<<<<<< HEAD
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
=======
>>>>>>> 0f22ecc7e0b99c154821c697e956537150bc89c3
        title: const Text(
          "Select Your Roadmap",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: _roadmapCards.map((card) {
                  return RoadmapCard(
                    title: card['title'],
                    description: card['description'],
                    icon: card['icon'],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => card['screen'],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Divider(
                color: Colors.white.withOpacity(0.5),
                thickness: 1.5,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 20),
              Card(
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/roadmap.png"),
                      const Text(
                        "Want to create your own custom roadmap?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CustomRoadmapScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Create Custom Roadmap",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
