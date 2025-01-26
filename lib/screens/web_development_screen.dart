import 'package:flutter/material.dart';

class WebDevelopmentScreen extends StatelessWidget {
  const WebDevelopmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Web Development"),
      ),
      body: const Center(
        child: Text("Welcome to the Web Development Roadmap!"),
      ),
    );
  }
}
