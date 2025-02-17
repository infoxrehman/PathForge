import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_forge/utils/gradient_card.dart';

class Base extends StatelessWidget {
  final String title;
  final String animationPath;
  final List<TechnologySection> sections;
  final VoidCallback? onStartLearning;

  const Base({
    super.key,
    required this.title,
    required this.animationPath,
    required this.sections,
    this.onStartLearning,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(animationPath),
              const SizedBox(height: 16),
              ...sections.map((section) => Column(
                    children: [
                      GradientCard(
                        title: section.title,
                        content: section.content,
                        colors: section.gradientColors,
                      ),
                      const SizedBox(height: 16),
                    ],
                  )),
              const SizedBox(height: 20),
              if (onStartLearning != null)
                Center(
                  child: ElevatedButton(
                    onPressed: onStartLearning,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Start Learning",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class TechnologySection {
  final String title;
  final String content;
  final List<Color> gradientColors;

  const TechnologySection({
    required this.title,
    required this.content,
    required this.gradientColors,
  });
}
