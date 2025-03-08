import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Roadmap extends StatefulWidget {
  const Roadmap({super.key});

  @override
  _RoadmapState createState() => _RoadmapState();
}

class _RoadmapState extends State<Roadmap> {
  List<bool> completedSteps = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Flutter Roadmap',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Timeline for Roadmap Steps
              _buildTimeline(),
              SizedBox(height: 20),
              // Mark as Completed Button
              ElevatedButton(
                onPressed: () {
                  if (completedSteps.every((step) => step)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Roadmap Completed! 🎉',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Complete all steps first!',
                            style: TextStyle(color: Colors.white)),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child:
                    Text('Mark as Completed', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build Timeline for Roadmap Steps
  Widget _buildTimeline() {
    return Column(
      children: [
        _buildTimelineTile(
          isFirst: true,
          isLast: false,
          completed: completedSteps[0],
          title: 'Learn Dart Basics',
          description: 'Understand variables, functions, and OOP in Dart.',
          index: 0,
        ),
        _buildTimelineTile(
          isFirst: false,
          isLast: false,
          completed: completedSteps[1],
          title: 'Flutter Widgets',
          description: 'Explore Stateless & Stateful widgets.',
          index: 1,
        ),
        _buildTimelineTile(
          isFirst: false,
          isLast: false,
          completed: completedSteps[2],
          title: 'State Management',
          description: 'Learn Provider, Riverpod, or Bloc.',
          index: 2,
        ),
        _buildTimelineTile(
          isFirst: false,
          isLast: false,
          completed: completedSteps[3],
          title: 'Networking & API Calls',
          description: 'Use HTTP package to fetch data from APIs.',
          index: 3,
        ),
        _buildTimelineTile(
          isFirst: false,
          isLast: true,
          completed: completedSteps[4],
          title: 'Database Integration',
          description: 'Integrate with databases like Firebase or SQLite.',
          index: 4,
        ),
      ],
    );
  }

  // Build Individual Timeline Tile
  Widget _buildTimelineTile({
    required bool isFirst,
    required bool isLast,
    required bool completed,
    required String title,
    required String description,
    required int index,
  }) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: LineStyle(
        color: completed ? Colors.greenAccent : Colors.grey[700]!,
      ),
      indicatorStyle: IndicatorStyle(
        width: 30,
        color: completed ? Colors.greenAccent : Colors.grey[700]!,
        iconStyle: IconStyle(
          iconData: completed ? Icons.check : Icons.circle,
          color: Colors.white,
        ),
      ),
      endChild: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8, // Constrain width
        ),
        child: Card(
          color: Colors.grey[900],
          elevation: 4,
          margin: EdgeInsets.only(left: 8, bottom: 16), // Reduced left margin
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(12.0), // Reduced padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        completed
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: completed ? Colors.greenAccent : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          completedSteps[index] = !completedSteps[index];
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
