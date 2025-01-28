import 'package:flutter/material.dart';

class CrossPlatformOptionsWidget extends StatelessWidget {
  const CrossPlatformOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      appBar: AppBar(
        backgroundColor: Colors.black, // Set AppBar color to black
        foregroundColor: Colors.white, // Set text color to white
        elevation: 4, // Add slight elevation to the AppBar for depth
        title: const Text(
          "Cross-Platform Development",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold, // Bold title for emphasis
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(20.0), // Increased padding for better spacing
        child: ListView(
          children: [
            // Heading with some space above
            const Text(
              "Cross-Platform Development",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5, // Add some letter spacing for style
              ),
            ),
            const SizedBox(height: 12), // Space between heading and description

            const Text(
              "Choose a framework to get started with cross-platform mobile development:",
              style: TextStyle(
                fontSize: 16,
                color: Colors
                    .white70, // Slightly lighter text for secondary content
              ),
            ),
            const SizedBox(height: 30), // Increased space before buttons

            // Flutter Button with Icon
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to Flutter Roadmap
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // White button background
                foregroundColor: Colors.black, // Black text color
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8), // Rounded button corners
                ),
                elevation: 3, // Slight shadow to give depth
              ),
              icon: Image.asset(
                "assets/icons/flutter-icon.png", // Path to Flutter icon
                width: 28,
                height: 28,
                color: Colors.black,
              ),
              label: const Text(
                "Flutter Roadmap",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight:
                      FontWeight.w500, // Slightly bolder text for emphasis
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Flutter is a powerful UI framework for building beautiful natively compiled applications for mobile, web, and desktop from a single codebase. It's known for its fast development cycle and expressive UI components.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 30), // Increased space between sections

            // React Native Button with Icon
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to React Native Roadmap
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 3,
              ),
              icon: Image.asset(
                "assets/icons/react-icon.png", // Path to React Native icon
                width: 28,
                height: 28,
                color: Colors.blue,
              ),
              label: const Text(
                "React Native Roadmap",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "React Native allows you to build mobile applications using JavaScript and React. It's one of the most popular frameworks for creating cross-platform apps, providing a seamless experience across Android and iOS.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
