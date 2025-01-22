import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed; // Callback for button action

  const ProfileButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed, // Accept the function as a parameter
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade300, // Background color
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
        ),
        onPressed: onPressed, // Trigger the function when clicked
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.black, // Icon color
            ),
            const SizedBox(width: 20),
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(), // Pushes the arrow icon to the end
            Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
