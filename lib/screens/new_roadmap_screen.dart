import 'package:flutter/material.dart';

class NewRoadmapScreen extends StatelessWidget {
  const NewRoadmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Roadmap"),
      ),
      body: const Center(
        child: Text("This is a placeholder for a new roadmap."),
      ),
    );
  }
}
