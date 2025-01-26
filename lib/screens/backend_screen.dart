import 'package:flutter/material.dart';

class BackendDevelopmentScreen extends StatelessWidget {
  const BackendDevelopmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Backend Development"),
      ),
      body: const Center(
        child: Text("Welcome to the Backend Development Roadmap!"),
      ),
    );
  }
}
