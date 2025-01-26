import 'package:flutter/material.dart';

class RoadmapCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onPressed;

  const RoadmapCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        color: Colors.grey.shade900,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: Icon(
              icon,
              color: Colors.black,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 18,
          ),
          onTap: onPressed,
        ),
      ),
    );
  }
}
