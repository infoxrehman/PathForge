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
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14.0,
          vertical: 8.0, // Reduced vertical padding
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50), // Reduced radius
          child: BottomNavigationBar(
            backgroundColor: Colors.grey.shade900,
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color(0xFF8A8A8A),
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(4.0), // Adjusted padding
                  child: Image.asset(
                    "assets/images/goal_icon.png",
                    width: 20, // Reduced icon size
                    height: 20,
                    color: _selectedIndex == 0
                        ? Colors.white
                        : const Color(0xFF8A8A8A),
                  ),
                ),
                label: 'Goals',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    "assets/images/activity.png",
                    width: 20,
                    height: 20,
                    color: _selectedIndex == 1
                        ? Colors.white
                        : const Color(0xFF8A8A8A),
                  ),
                ),
                label: 'Activity',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    "assets/images/performance_icon.png",
                    width: 20,
                    height: 20,
                    color: _selectedIndex == 2
                        ? Colors.white
                        : const Color(0xFF8A8A8A),
                  ),
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    "assets/images/profile-1.png",
                    width: 20,
                    height: 20,
                    color: _selectedIndex == 3
                        ? Colors.white
                        : const Color(0xFF8A8A8A),
                  ),
                ),
                label: 'Profile',
              ),
            ],
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              fontFamily: 'Lato',
            ),
          ),
        ),
      ),
    );
  }
}
