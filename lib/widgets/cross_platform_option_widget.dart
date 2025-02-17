import 'package:flutter/material.dart';
import 'package:path_forge/screens/roadmap.dart';

class CrossPlatformOptionsWidget extends StatelessWidget {
  const CrossPlatformOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Cross-Platform Development",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Choose a framework to get started:",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 20),

            // Flutter Card
            _buildFrameworkCard(
              context,
              title: "Flutter Roadmap",
              description:
                  "Flutter is a UI framework for building beautiful, natively compiled applications from a single codebase.",
              iconPath: "assets/icons/flutter-icon.png",
              iconColor: Colors.blue,
              onTap: () {
                // Navigate to Flutter Roadmap
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Roadmap(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),

            // React Native Card
            _buildFrameworkCard(
              context,
              title: "React Native Roadmap",
              description:
                  "React Native allows you to build mobile apps using JavaScript and React for a seamless cross-platform experience.",
              iconPath: "assets/icons/react-icon.png",
              iconColor: Colors.cyan,
              onTap: () {
                // Navigate to React Native Roadmap
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFrameworkCard(
    BuildContext context, {
    required String title,
    required String description,
    required String iconPath,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                iconPath,
                width: 40,
                height: 40,
                color: iconColor,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
