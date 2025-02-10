import 'package:flutter/material.dart';
import 'package:path_forge/screens/profile_screen.dart';
import 'package:path_forge/screens/goals.dart';
import 'package:path_forge/screens/progress_screen.dart';
import 'package:path_forge/screens/explore_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Goals(),
    ProgressScreen(),
    ExploreScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 1.0,
        ), // Reduced padding
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              40), // Slightly less rounded for a slim feel
          child: BottomNavigationBar(
            backgroundColor: Colors.grey.shade900,
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color(0xFF8A8A8A),
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            items: [
              _buildNavItem("assets/icons/goal_icon.png", "Goals", 0),
              _buildNavItem("assets/icons/activity.png", "Activity", 1),
              _buildNavItem("assets/icons/performance_icon.png", "Explore", 2),
              _buildNavItem("assets/icons/coffee-icon.png", "Profile", 3),
            ],
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedLabelStyle: const TextStyle(
              fontSize: 11, // Slightly smaller font
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.normal,
              fontFamily: 'Lato',
            ),
          ),
        ),
      ),
    );
  }

  /// Helper method to build BottomNavigationBarItem with icon
  BottomNavigationBarItem _buildNavItem(
      String iconPath, String label, int index) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4.0,
        ), // Reduced padding to slim down the bar
        child: Image.asset(
          iconPath,
          width: 20,
          height: 20,
          color:
              _selectedIndex == index ? Colors.white : const Color(0xFF8A8A8A),
        ),
      ),
      label: label,
    );
  }
}
