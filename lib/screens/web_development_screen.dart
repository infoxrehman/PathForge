import 'package:flutter/material.dart';

class WebDevelopmentScreen extends StatelessWidget {
  const WebDevelopmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text(
          "Web Development",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.teal.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildRoadmapCard(
                title: "Frontend Development",
                description:
                "Learn how to build user interfaces and create engaging web experiences using HTML, CSS, JavaScript, and modern frameworks like React, Angular, or Vue.",
                buttonText: "Generate Frontend Roadmap",
                gradientColors: [Colors.purple.shade400, Colors.blue.shade400],
                onPressed: () {
                  _showRoadmap(context, "Frontend");
                },
              ),
              const SizedBox(height: 20),
              _buildRoadmapCard(
                title: "Backend Development",
                description:
                "Master server-side programming, databases, APIs, and deployment. Learn technologies like Node.js, Django, Flask, or Laravel.",
                buttonText: "Generate Backend Roadmap",
                gradientColors: [Colors.teal.shade400, Colors.green.shade400],
                onPressed: () {
                  _showRoadmap(context, "Backend");
                },
              ),
              const SizedBox(height: 20),
              _buildRoadmapCard(
                title: "Fullstack Development",
                description:
                "Become a fullstack developer by mastering both frontend and backend technologies. Learn to build complete web applications from scratch.",
                buttonText: "Generate Fullstack Roadmap",
                gradientColors: [Colors.orange.shade400, Colors.red.shade400],
                onPressed: () {
                  _showRoadmap(context, "Fullstack");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoadmapCard({
    required String title,
    required String description,
    required String buttonText,
    required List<Color> gradientColors,
    required VoidCallback onPressed,
  }) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 6,
                  shadowColor: Colors.black26,
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: gradientColors[0], // Use gradient color for text
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRoadmap(BuildContext context, String roadmapType) {
    String roadmapContent = "";
    switch (roadmapType) {
      case "Frontend":
        roadmapContent = "Frontend Roadmap:\n\n"
            "1. Learn HTML & CSS\n"
            "2. Master JavaScript\n"
            "3. Explore Frameworks (React, Angular, Vue)\n"
            "4. Learn State Management (Redux, Context API)\n"
            "5. Build Responsive Designs\n"
            "6. Learn Version Control (Git)\n"
            "7. Deploy Your Frontend Projects";
        break;
      case "Backend":
        roadmapContent = "Backend Roadmap:\n\n"
            "1. Learn a Backend Language (Node.js, Python, PHP)\n"
            "2. Understand Databases (SQL, MongoDB)\n"
            "3. Build RESTful APIs\n"
            "4. Learn Authentication & Authorization\n"
            "5. Explore Frameworks (Express, Django, Flask)\n"
            "6. Learn Deployment (Docker, AWS, Heroku)\n"
            "7. Optimize Performance & Security";
        break;
      case "Fullstack":
        roadmapContent = "Fullstack Roadmap:\n\n"
            "1. Learn Frontend Basics (HTML, CSS, JavaScript)\n"
            "2. Master a Frontend Framework (React, Angular, Vue)\n"
            "3. Learn Backend Development (Node.js, Django, etc.)\n"
            "4. Understand Databases (SQL & NoSQL)\n"
            "5. Build RESTful APIs\n"
            "6. Learn Deployment (Fullstack Projects)\n"
            "7. Explore DevOps Basics";
        break;
      default:
        roadmapContent = "No roadmap available for this option.";
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("$roadmapType Roadmap"),
          content: Text(roadmapContent),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}