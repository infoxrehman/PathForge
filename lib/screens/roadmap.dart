import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Roadmap extends StatefulWidget {
  const Roadmap({super.key});

  @override
  _RoadmapState createState() => _RoadmapState();
}

class _RoadmapState extends State<Roadmap> {
  List<Map<String, dynamic>> roadmapSteps = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _loadRoadmapData();
  }

  Future<void> _loadRoadmapData() async {
    if (user == null) return;

    DocumentSnapshot snapshot =
        await _firestore.collection('roadmaps').doc(user!.uid).get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      setState(() {
        roadmapSteps = List<Map<String, dynamic>>.from(data['steps'] ?? []);
      });
    } else {
      _initializeRoadmap();
    }
  }

  Future<void> _initializeRoadmap() async {
    roadmapSteps = [
      {
        'title': 'Learn Dart Basics',
        'description': 'Understand variables, functions, and OOP in Dart.',
        'completed': false
      },
      {
        'title': 'Flutter Widgets',
        'description': 'Explore Stateless & Stateful widgets.',
        'completed': false
      },
      {
        'title': 'State Management',
        'description': 'Learn Provider, Riverpod, or Bloc.',
        'completed': false
      },
      {
        'title': 'Networking & API Calls',
        'description': 'Use HTTP package to fetch data from APIs.',
        'completed': false
      },
      {
        'title': 'Database Integration',
        'description': 'Integrate with databases like Firebase or SQLite.',
        'completed': false
      },
    ];

    await _saveRoadmapData();
  }

  Future<void> _saveRoadmapData() async {
    if (user == null) return;

    await _firestore.collection('roadmaps').doc(user!.uid).set({
      'steps': roadmapSteps,
      'completed': roadmapSteps.every((step) => step['completed']),
    });

    if (roadmapSteps.every((step) => step['completed'])) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Roadmap Completed! 🎉',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

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
      body: roadmapSteps.isEmpty
          ? Center(child: CircularProgressIndicator(color: Colors.white))
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildTimeline(),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _saveRoadmapData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child:
                          Text('Save Progress', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildTimeline() {
    return Column(
      children: List.generate(
        roadmapSteps.length,
        (index) => _buildTimelineTile(
          isFirst: index == 0,
          isLast: index == roadmapSteps.length - 1,
          completed: roadmapSteps[index]['completed'],
          title: roadmapSteps[index]['title'],
          description: roadmapSteps[index]['description'],
          index: index,
        ),
      ),
    );
  }

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
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        child: Card(
          color: Colors.grey[900],
          elevation: 4,
          margin: EdgeInsets.only(left: 8, bottom: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
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
                          roadmapSteps[index]['completed'] = !completed;
                        });
                        _saveRoadmapData();
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
