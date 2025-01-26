import 'package:flutter/material.dart';

class DataScienceScreen extends StatelessWidget {
  const DataScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Science"),
      ),
      body: const Center(
        child: Text("Welcome to the Data Science Roadmap!"),
      ),
    );
  }
}
