import 'package:flutter/material.dart';
import 'package:path_forge/auth/login.dart';
import 'package:path_forge/widgets/profile_button.dart';
import 'profile_editing_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = 'Abdullah Shaikh'; // Default name
  String role = '~ Flutter Dev'; // Default role
  String avatarUrl = "assets/images/download.jpeg"; // Default avatar

  void editProfile(BuildContext context) async {
    // Await the updated profile data from the editing screen
    final updatedProfile = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileEditingScreen(),
      ),
    );

    // If data is returned, update the profile
    if (updatedProfile != null) {
      setState(() {
        username = updatedProfile['username'] ?? username;
        role = updatedProfile['role'] ?? role;
        avatarUrl = updatedProfile['avatarUrl'] ?? avatarUrl;
      });
    }
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
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
                    child: Image.asset(
                      avatarUrl,
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
