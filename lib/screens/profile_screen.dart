import 'package:flutter/material.dart';
import 'package:path_forge/widgets/profile_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void editProfile() {
    print("Edit profile button clicked!");
    // Add your functionality here
  }

  void connectWallet() {
    print("Connect wallet button clicked!");
    // Add your functionality here
  }

  void getVerified() {
    print("Get verified button clicked!");
    // Add your functionality here
  }

  void logout() {
    print("Logout button clicked!");
    // Add your functionality here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor:
                    Colors.white, // White background behind the image
                child: ClipOval(
                  // Ensures the image is cropped properly within the CircleAvatar
                  child: Image.asset(
                    "assets/images/download.jpeg",
                    fit: BoxFit
                        .cover, // Ensures the image covers the available area
                    height: 140, // Match the height to double the radius
                    width: 140, // Match the width to double the radius
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Abdullah Shaikh',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '~ Flutter Dev',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Align content vertically
                children: [
                  Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    // Ensures text wraps properly if it’s long
                    child: Text(
                      'Connect your wallet as tokens are available!',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                '0 \$CODR Points',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ProfileButton(
                label: 'Edit profile',
                icon: Icons.edit,
                onPressed: editProfile,
              ),
              ProfileButton(
                label: 'Connect wallet',
                icon: Icons.wallet,
                onPressed: connectWallet,
              ),
              ProfileButton(
                label: 'Get verified',
                icon: Icons.verified,
                onPressed: getVerified,
              ),
              ProfileButton(
                label: 'Logout',
                icon: Icons.logout,
                onPressed: logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
