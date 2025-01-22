import 'package:flutter/material.dart';
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
    },
    {
      'title': "Web Development",
      'description': "Master HTML, CSS, and JavaScript for modern web.",
      'icon': Icons.web,
    },
    {
      'title': "Machine Learning",
      'description': "Dive into ML concepts and real-world applications.",
      'icon': Icons.memory,
    },
    {
      'title': "Data Science",
      'description': "Learn data analysis and visualization techniques.",
      'icon': Icons.bar_chart,
    },
    {
      'title': "Backend Development",
      'description': "Explore APIs, databases, and server-side programming.",
      'icon': Icons.storage,
    },
  ];

  void _addNewRoadmapCard() {
    setState(() {
      _roadmapCards.add({
        'title': "New Roadmap",
        'description': "Description for the new roadmap.",
        'icon': Icons.add_circle_outline,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Select Your Roadmap",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
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
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: _addNewRoadmapCard,
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
