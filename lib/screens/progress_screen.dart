import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String name = '';
  String role = '';
  List<Map<String, dynamic>> roadmapSteps = [];

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _loadRoadmapProgress();
  }

  Future<void> _loadUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user == null) return;

      DocumentSnapshot userDoc =
          await _firestore.collection("users").doc(user.uid).get();

      if (userDoc.exists) {
        setState(() {
          name = userDoc['name'] ?? '';
          role = userDoc['role'] ?? '';
        });
      }
    } catch (e) {
      debugPrint("Error loading user data: $e");
    }
  }

  Future<void> _loadRoadmapProgress() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection("roadmaps").get();

      if (querySnapshot.docs.isNotEmpty) {
        var roadmapDoc = querySnapshot.docs.first;
        List<dynamic> stepsData = roadmapDoc['steps'] ?? [];

        List<Map<String, dynamic>> steps = stepsData.map((step) {
          return {
            'title': step['title'] ?? 'Untitled Step',
            'description': step['description'] ?? '',
            'completed': step['completed'] ?? false,
          };
        }).toList();

        setState(() {
          roadmapSteps = steps;
        });
      }
    } catch (e) {
      debugPrint("Error loading roadmap data: $e");
    }
  }

  double _getRandomProgress() {
    List<double> progressValues = [0.2, 0.5, 0.6];
    return progressValues[Random().nextInt(progressValues.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            'assets/images/download.jpeg',
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Roboto",
                                fontSize: 22,
                              ),
                            ),
                            Text(
                              "Role: $role",
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Roboto",
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Progress Report:",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Roboto",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Cross Platform - Flutter",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Roboto",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                roadmapSteps.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(color: Colors.green),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          itemCount: roadmapSteps.length,
                          itemBuilder: (context, index) {
                            final step = roadmapSteps[index];
                            bool isCompleted = step['completed'];
                            double progress =
                                isCompleted ? 1.0 : _getRandomProgress();
                            Color progressColor = isCompleted
                                ? Colors.green
                                : (progress == 0.2
                                    ? Colors.red
                                    : Colors.orange);

                            return ProgressCard(
                              title: step['title'],
                              description: step['description'],
                              progress: progress,
                              progressColor: progressColor,
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressCard extends StatelessWidget {
  final String title;
  final String description;
  final double progress;
  final Color progressColor;

  const ProgressCard({
    super.key,
    required this.title,
    required this.description,
    required this.progress,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.grey.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto",
              ),
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade600,
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            ),
            SizedBox(height: 10),
            Text(
              "${(progress * 100).toStringAsFixed(0)}% completed",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
