import 'package:flutter/material.dart';
import 'package:path_forge/utils/base.dart';

class NativeOptionsWidget extends StatelessWidget {
  const NativeOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Base(
      title: "Native Development",
      animationPath: 'assets/animations/native.json',
      sections: [
        TechnologySection(
          title: "Java Roadmap",
          content:
              "Java is a powerful programming language widely used for Android development. It's known for its reliability, robustness, and extensive libraries.",
          gradientColors: [Colors.orange, Colors.yellow],
        ),
        TechnologySection(
          title: "Kotlin Roadmap",
          content:
              "Kotlin is a modern, concise, and expressive language officially supported for Android development. It enhances productivity and ensures code safety.",
          gradientColors: [Colors.green, Colors.lime],
        ),
      ],
      onStartLearning: () {},
    );
  }
}
