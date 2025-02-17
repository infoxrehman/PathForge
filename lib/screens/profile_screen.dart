import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_forge/auth/login_page.dart';
import 'package:path_forge/models/user.dart';
import 'profile_editing_screen.dart';
import 'package:path_forge/pages/future_enhancement_page.dart';
import 'package:path_forge/widgets/profile_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = 'Abdullah Shaikh'; // Default name
  String role = '~ Flutter Dev'; // Default role
  String avatarUrl = ''; // No default image
  User user = User(
    id: '',
    name: 'Abdullah Shaikh',
    imageUrl: '',
    email: '',
    role: '',
  );
  bool isAssetImage = true;

  void editProfile(BuildContext context) async {
    // Await updated profile data from editing screen
    final updatedProfile = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileEditingScreen(),
      ),
    );

    // Update profile details
    if (updatedProfile != null) {
      setState(() {
        username = updatedProfile['username'] ?? username;
        role = updatedProfile['role'] ?? role;
        avatarUrl = updatedProfile['avatarUrl'] ?? avatarUrl;
        isAssetImage = avatarUrl.isEmpty; // Set image source dynamically
      });
    }
  }

  void connectWallet() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FutureEnhancementPage(),
      ),
    );
  }

  void getVerified() {
    print("Get verified button clicked!");
  }

  void logout() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 50.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: isAssetImage
                        ? Image.asset(
                            "assets/images/download.jpeg",
                            fit: BoxFit.cover,
                            height: 140,
                            width: 140,
                          )
                        : Image.file(
                            File(avatarUrl),
                            fit: BoxFit.cover,
                            height: 140,
                            width: 140,
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  role,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 30),
                ProfileButton(
                  label: 'Edit profile',
                  icon: Icons.edit,
                  onPressed: () => editProfile(context),
                ),
                const SizedBox(height: 5),
                ProfileButton(
                  label: 'Connect wallet',
                  icon: Icons.wallet,
                  onPressed: connectWallet,
                ),
                const SizedBox(height: 5),
                ProfileButton(
                  label: 'Get verified',
                  icon: Icons.verified,
                  onPressed: getVerified,
                ),
                const SizedBox(height: 5),
                ProfileButton(
                  label: 'Logout',
                  icon: Icons.logout,
                  onPressed: logout,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
