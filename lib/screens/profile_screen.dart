import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:path_forge/auth/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'profile_editing_screen.dart';
import 'package:path_forge/pages/future_enhancement_page.dart';
import 'package:path_forge/widgets/profile_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void checkUser(BuildContext context) {
    final User? user = _firebaseAuth.currentUser;
    if (user == null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false,
      );
    }
  }

  String username = '';
  String role = '';
  String avatarUrl = '';

  bool isAssetImage = true;

  @override
  void initState() {
    super.initState();
    loadUserInfo();
  }

  void loadUserInfo() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (userDoc.exists) {
      setState(() {
        username = userDoc.data()?['name'] ?? "Username";
        role = userDoc.data()?['role'] ?? "Bio";
        avatarUrl = userDoc.data()?['imageUrl'] ?? "";
      });
    }
  }

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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FutureEnhancementPage(),
      ),
    );
  }

  void logout() {
    _firebaseAuth.signOut();
    checkUser(context);
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
                  "@$username",
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
