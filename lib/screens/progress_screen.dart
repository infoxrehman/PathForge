import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
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
                      // Profile Picture
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          'assets/images/download.jpeg',
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(width: 20),
                      // Profile Info
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Abdullah Shaikh",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto",
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            "Role: App Developer",
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

              // Progress Report Section
              SizedBox(height: 20),
              Text(
                "Progress Report",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Roboto",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Progress Cards in GridView Section
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap:
                    true, // Makes the grid view take only as much space as needed
                physics:
                    NeverScrollableScrollPhysics(), // Disables scrolling for the grid
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                  crossAxisSpacing: 10, // Space between the columns
                  mainAxisSpacing: 10, // Space between the rows
                  childAspectRatio: 1, // Ensures the cards are squared
                ),
                itemCount: 4, // Number of cards to display
                itemBuilder: (context, index) {
                  return ProgressCard(
                    title: "Task ${index + 1}",
                    progress:
                        (index + 1) * 0.25, // Varying progress for each card
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressCard extends StatelessWidget {
  final String title;
  final double progress; // Value between 0.0 and 1.0

  const ProgressCard({
    super.key,
    required this.title,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero, // Remove any default margin
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
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade600,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
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
