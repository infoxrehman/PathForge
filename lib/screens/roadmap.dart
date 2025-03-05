import 'package:flutter/material.dart';

class Roadmap extends StatefulWidget {
  const Roadmap({super.key});

  @override
  State<Roadmap> createState() => _RoadmapState();
}

class _RoadmapState extends State<Roadmap> {
  List<Map<String, dynamic>> roadmapSteps = [
    {
      "title": "Step 1: Learn Basics",
      "description": "Start with programming fundamentals and logic building.",
      "completed": false
    },
    {
      "title": "Step 2: Build Projects",
      "description": "Work on small projects to strengthen your coding skills.",
      "completed": false
    },
    {
      "title": "Step 3: Learn Advanced Concepts",
      "description": "Explore data structures, algorithms, and system design.",
      "completed": false
    },
    {
      "title": "Step 4: Contribute to Open Source",
      "description": "Engage in open-source projects to gain real-world experience.",
      "completed": false
    },
    {
      "title": "Step 5: Apply for Jobs",
      "description": "Prepare for interviews and start applying for jobs or internships.",
      "completed": false
    },
  ];

  void toggleCompletion(int index) {
    setState(() {
      roadmapSteps[index]['completed'] = !roadmapSteps[index]['completed'];
    });
  }

  void completeAll() {
    setState(() {
      for (var step in roadmapSteps) {
        step['completed'] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Roadmap",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: roadmapSteps.length,
                itemBuilder: (context, index) {
                  return RoadmapStep(
                    isCompleted: roadmapSteps[index]['completed'],
                    title: roadmapSteps[index]['title'],
                    description: roadmapSteps[index]['description'],
                    onTap: () => toggleCompletion(index),
                    isLast: index == roadmapSteps.length - 1,
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: completeAll,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
              child: const Text(
                "Complete All",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoadmapStep extends StatelessWidget {
  final bool isCompleted;
  final String title;
  final String description;
  final VoidCallback onTap;
  final bool isLast;

  const RoadmapStep({
    required this.isCompleted,
    required this.title,
    required this.description,
    required this.onTap,
    required this.isLast,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Icon(
                isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isCompleted ? Colors.green : Colors.grey,
                size: 30,
              ),
            ),
            if (!isLast)
              Container(
                width: 3,
                height: 50,
                color: Colors.grey[700],
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Card(
            color: Colors.black, // Changed to black
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.grey[700]!), // Border for contrast
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isCompleted ? Colors.green : Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}