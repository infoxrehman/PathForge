import 'package:flutter/material.dart';

class CloudComputingScreen extends StatelessWidget {
  const CloudComputingScreen({super.key});

  void _startCloudJourney() {
    // Replace with actual navigation logic
    print("Starting Cloud Journey...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Cloud Computing'),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card for "What is Cloud Computing?"
            _buildCard(
              color: const Color(0xFF6A11CB),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "What is Cloud Computing?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Cloud computing is the delivery of computing services like servers, storage, databases, networking, software, and more over the internet ('the cloud'). It offers faster innovation, flexible resources, and economies of scale.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Card for "Why Choose Cloud Computing?"
            _buildCard(
              color: const Color(0xFF2575FC),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Why Choose Cloud Computing?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "1. Cost Efficiency: Pay only for what you use.\n"
                    "2. Scalability: Easily scale resources up or down.\n"
                    "3. Flexibility: Access data and applications from anywhere.\n"
                    "4. Security: Advanced security features to protect your data.\n"
                    "5. Career Growth: High demand for cloud professionals.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Card for "Career Paths in Cloud Computing"
            _buildCard(
              color: const Color(0xFF00C853),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Career Paths in Cloud Computing",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "1. Cloud Architect\n"
                    "2. Cloud Developer\n"
                    "3. Cloud Security Engineer\n"
                    "4. DevOps Engineer\n"
                    "5. Cloud Consultant",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Start Your Cloud Journey Button
            Center(
              child: ElevatedButton(
                onPressed: _startCloudJourney,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Start Your Cloud Journey",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build a card with a specific color
  Widget _buildCard({required Color color, required Widget child}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      padding: const EdgeInsets.all(16.0),
      child: child,
    );
  }
}
