import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NativeOptionsWidget extends StatelessWidget {
  const NativeOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "Native Development",
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 10),

            // Subtitle
            Text(
              "Choose a programming language to get started with native Android development:",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 25),

            // Java Card
            _buildOptionCard(
              context,
              title: "Java Roadmap",
              description:
                  "Java is a powerful programming language widely used for Android development. It's known for its reliability, robustness, and extensive libraries.",
              imagePath: "assets/icons/java-icon.png",
              onTap: () {
                // Navigate to Java Roadmap
              },
            ),

            const SizedBox(height: 20),

            // Kotlin Card
            _buildOptionCard(
              context,
              title: "Kotlin Roadmap",
              description:
                  "Kotlin is a modern, concise, and expressive language officially supported for Android development. It enhances productivity and ensures code safety.",
              imagePath: "assets/icons/kotlin-icon.png",
              onTap: () {
                // Navigate to Kotlin Roadmap
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(
    BuildContext context, {
    required String title,
    required String description,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.grey[900], // Dark gray for a premium look
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Icon
              Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 15),

              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: GoogleFonts.poppins(
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
