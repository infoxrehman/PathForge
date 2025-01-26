import 'package:flutter/material.dart';

class MachineLearningScreen extends StatelessWidget {
  const MachineLearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Machine Learning"),
      ),
      body: const Center(
        child: Text("Welcome to the Machine Learning Roadmap!"),
      ),
    );
  }
}
