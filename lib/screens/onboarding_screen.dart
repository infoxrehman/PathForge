import 'package:flutter/material.dart';
import 'package:path_forge/pages/page1.dart';
import 'package:path_forge/pages/page2.dart';
import 'package:path_forge/pages/page3.dart';
import 'package:path_forge/pages/page4.dart';
import 'package:path_forge/screens/dash_board.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0; // To track the current page index.

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      // Update the current page index when the page changes.
      setState(() {
        _currentPage = _controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final int totalPages = 4;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          // PageView to display the onboarding pages
          PageView(
            controller: _controller,
            children: const [
              Page1(),
              Page2(),
              Page3(),
              Page4(),
            ],
          ),

          // Navigation Controls
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left-side Button: Skip, Prev, or Nothing
                if (_currentPage == 0)
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(totalPages - 1);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                else if (_currentPage > 0)
                  GestureDetector(
                    onTap: () {
                      _controller.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text(
                      "Prev",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                // SmoothPageIndicator
                SmoothPageIndicator(
                  controller: _controller,
                  count: totalPages,
                  effect: const WormEffect(
                    activeDotColor: Colors.black,
                    dotColor: Colors.grey,
                    dotHeight: 15,
                    dotWidth: 15,
                    spacing: 6,
                  ),
                ),

                // Right-side Button: Next or Done
                if (_currentPage == totalPages - 1)
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Dashboard(),
                        ),
                      );
                    },
                    child: const Text(
                      "Done",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                else
                  GestureDetector(
                    onTap: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text(
                      "Next",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
