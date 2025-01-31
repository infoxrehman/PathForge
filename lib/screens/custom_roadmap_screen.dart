import 'package:flutter/material.dart';

class CustomRoadmapScreen extends StatefulWidget {
  const CustomRoadmapScreen({super.key});

  @override
  State<CustomRoadmapScreen> createState() => _CustomRoadmapScreenState();
}

class _CustomRoadmapScreenState extends State<CustomRoadmapScreen> {
  // List to store roadmap cards
  final List<Map<String, String>> _roadmapCards = [];

  // Function to add a new roadmap card
  void _addRoadmapCard() {
    showDialog(
      context: context,
      builder: (context) {
        String title = "";
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text(
            "Create Roadmap",
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            autofocus: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Enter roadmap title...",
              hintStyle: const TextStyle(color: Colors.white54),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
            onChanged: (value) {
              title = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                if (title.isNotEmpty) {
                  setState(() {
                    _roadmapCards.add({
                      "title": title,
                      "id": DateTime.now().toString(),
                    });
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text(
                "Create",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }

  // Function to edit a roadmap card title
  void _editRoadmapCard(int index) {
    showDialog(
      context: context,
      builder: (context) {
        String updatedTitle = _roadmapCards[index]["title"]!;
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text(
            "Edit Roadmap Title",
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            autofocus: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Enter new title...",
              hintStyle: const TextStyle(color: Colors.white54),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
            onChanged: (value) {
              updatedTitle = value;
            },
            controller: TextEditingController(text: updatedTitle),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                if (updatedTitle.isNotEmpty) {
                  setState(() {
                    _roadmapCards[index]["title"] = updatedTitle;
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }

  // Function to delete a roadmap card
  void _deleteRoadmapCard(int index) {
    setState(() {
      _roadmapCards.removeAt(index);
    });
  }

  // Function to navigate to the roadmap details screen
  void _navigateToRoadmapDetails(Map<String, String> roadmap) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoadmapDetailsScreen(roadmap: roadmap),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Custom Roadmaps"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display roadmap cards
            Expanded(
              child: ListView.builder(
                itemCount: _roadmapCards.length,
                itemBuilder: (context, index) {
                  final roadmap = _roadmapCards[index];
                  return Card(
                    color: Colors.grey[900],
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        roadmap["title"]!,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _editRoadmapCard(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteRoadmapCard(index),
                          ),
                        ],
                      ),
                      onTap: () => _navigateToRoadmapDetails(roadmap),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRoadmapCard,
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}

// Roadmap Details Screen
class RoadmapDetailsScreen extends StatelessWidget {
  final Map<String, String> roadmap;

  const RoadmapDetailsScreen({super.key, required this.roadmap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(roadmap["title"]!),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Roadmap: ${roadmap["title"]!}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Add your roadmap steps here!",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
