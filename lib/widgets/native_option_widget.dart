import 'package:flutter/material.dart';

class NativeOptionsWidget extends StatelessWidget {
  const NativeOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      appBar: AppBar(
        backgroundColor: Colors.black, // Set AppBar color to black
        foregroundColor: Colors.white, // Set text color to white
        elevation: 4, // Add slight elevation to the AppBar for depth
        title: const Text(
          "Native Development",
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
              "Native Development",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5, // Add some letter spacing for style
              ),
            ),
            const SizedBox(height: 12), // Space between heading and description

            const Text(
              "Choose a programming language to get started with native Android development:",
              style: TextStyle(
                fontSize: 16,
                color: Colors
                    .white70, // Slightly lighter text for secondary content
              ),
            ),
            const SizedBox(height: 30), // Increased space before buttons

            // Java Button with Icon
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to Java Roadmap
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
                "assets/icons/java-icon.png", // Path to Java icon
                width: 28,
                height: 28,
                color: Colors.black,
              ),
              label: const Text(
                "Java Roadmap",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight:
                      FontWeight.w500, // Slightly bolder text for emphasis
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Java is a powerful programming language widely used for Android development. It's known for its reliability, robustness, and extensive libraries that make it ideal for building native Android apps.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 30), // Increased space between sections

            // Kotlin Button with Icon
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to Kotlin Roadmap
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
                "assets/icons/kotlin-icon.png", // Path to Kotlin icon
                width: 28,
                height: 28,
                color: Colors.black,
              ),
              label: const Text(
                "Kotlin Roadmap",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Kotlin is a modern, concise, and expressive language officially supported for Android development. It offers seamless interoperability with Java and is designed to boost developer productivity and code safety.",
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
