import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Roadmap extends StatefulWidget {
  const Roadmap({super.key});

  @override
  State<Roadmap> createState() => _RoadmapState();
}

class _RoadmapState extends State<Roadmap> {
  List<Map<String, dynamic>> roadmapSteps = [
    {
      "title": "Learn Dart Basics",
      "description": "Understand variables, functions, and OOP in Dart.",
      "completed": false
    },
    {
      "title": "Flutter Widgets",
      "description": "Explore Stateless & Stateful widgets.",
      "completed": false
    },
    {
      "title": "State Management",
      "description": "Learn Provider, Riverpod, or Bloc.",
      "completed": false
    },
    {
      "title": "Networking & API Calls",
      "description": "Use HTTP package to fetch data from APIs.",
      "completed": false
    },
    {
      "title": "Database Integration",
      "description": "Work with SQLite or Firebase.",
      "completed": false
    },
  ];

  void toggleCompletion(int index) {
    setState(() {
      roadmapSteps[index]["completed"] = !roadmapSteps[index]["completed"];
    });
  }

  void markAllStepsCompleted() {
    setState(() {
      for (var step in roadmapSteps) {
        step["completed"] = true;
      }
    });
    // Pop the screen after marking all steps as completed
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("Roadmap Progress"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: roadmapSteps.length,
              itemBuilder: (context, index) {
                final step = roadmapSteps[index];
                return Column(
                  children: [
                    TimelineTile(
                      alignment: TimelineAlign.start,
                      isFirst: index == 0,
                      isLast: index == roadmapSteps.length - 1,
                      beforeLineStyle: LineStyle(
                        color: step["completed"] ? Colors.green : Colors.grey,
                      ),
                      indicatorStyle: IndicatorStyle(
                        width: 20,
                        height: 20,
                        color: step["completed"] ? Colors.green : Colors.grey,
                        iconStyle: step["completed"]
                            ? IconStyle(
                                iconData: Icons.check,
                                color: Colors.white,
                              )
                            : null,
                      ),
                      endChild: Card(
                        color: Colors.white12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    step["title"],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Checkbox(
                                    value: step["completed"],
                                    onChanged: (_) => toggleCompletion(index),
                                    activeColor: Colors.green,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                step["description"],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Add spacing between cards
                    if (index != roadmapSteps.length - 1)
                      const SizedBox(height: 16),
                  ],
                );
              },
            ),
          ),
          // Button to mark all steps as completed
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: markAllStepsCompleted,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Mark All as Completed",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
