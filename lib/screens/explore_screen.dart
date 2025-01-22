import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            child: Card(
              color: Colors.grey.shade300,
              child: Image.asset(
                "assets/images/productive.png",
                fit: BoxFit.cover,
                height: 300,
                width: 400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
