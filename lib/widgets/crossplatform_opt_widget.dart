import 'package:flutter/material.dart';
import 'package:path_forge/utils/base.dart';

class CrossPlatformOptionsWidget extends StatelessWidget {
  const CrossPlatformOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Base(
      title: "Cross-Platform Development",
      animationPath: 'assets/animations/cross-platform.json',
      sections: [
        TechnologySection(
          title: "Flutter Roadmap",
          content:
              "Flutter is a UI framework for building beautiful, natively compiled applications from a single codebase.",
          gradientColors: [Colors.blue, Colors.cyan],
        ),
        TechnologySection(
          title: "React Native Roadmap",
          content:
              "React Native allows you to build mobile apps using JavaScript and React for a seamless cross-platform experience.",
          gradientColors: [Colors.cyan, Colors.teal],
        ),
      ],
      onStartLearning: () {},
    );
  }
}
