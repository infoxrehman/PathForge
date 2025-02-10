import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'dart:math';

class CodingChallengesScreen extends StatefulWidget {
  const CodingChallengesScreen({super.key});

  @override
  State<CodingChallengesScreen> createState() => _CodingChallengesScreenState();
}

class _CodingChallengesScreenState extends State<CodingChallengesScreen> {
  int selectedOption = -1;
  bool isSubmitted = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question": "What is a garbage collector in programming?",
      "options": [
        "A tool to remove syntax errors",
        "A process that automatically frees memory",
        "A debugger for runtime issues",
        "A compiler feature"
      ],
      "answer": 1
    },
    {
      "question": "Which of the following is a statically typed language?",
      "options": ["Python", "JavaScript", "C++", "Ruby"],
      "answer": 2
    },
    {
      "question": "What does 'print()' do in Python?",
      "options": [
        "Executes a command",
        "Displays output",
        "Reads user input",
        "Runs a loop"
      ],
      "answer": 1
    },
    {
      "question": "Which keyword is used to define a function in Python?",
      "options": ["func", "define", "def", "function"],
      "answer": 2
    },
    {
      "question": "What is the main purpose of an IDE?",
      "options": [
        "To browse the internet",
        "To compile and execute programs",
        "To play games",
        "To make API calls"
      ],
      "answer": 1
    }
  ];

  late Map<String, dynamic> dailyQuestion;

  @override
  void initState() {
    super.initState();
    _loadDailyQuestion();
  }

  void _loadDailyQuestion() {
    final random = Random();
    dailyQuestion = questions[random.nextInt(questions.length)];
  }

  void _submitAnswer() {
    setState(() {
      isSubmitted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(
          "Daily Coding Challenges",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Text(
              "Today's Challenge",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            _buildChallengeCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildChallengeCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.grey[900],
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    dailyQuestion["question"],
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Icon(LucideIcons.brain, color: Colors.blueAccent, size: 28),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: List.generate(dailyQuestion["options"].length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: RadioListTile(
                    activeColor: Colors.blueAccent,
                    title: Text(
                      dailyQuestion["options"][index],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    value: index,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value as int;
                      });
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: selectedOption == -1
                    ? null
                    : () {
                        _submitAnswer();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              selectedOption == dailyQuestion["answer"]
                                  ? "🎉 Correct! Great job!"
                                  : "❌ Incorrect! Try again tomorrow!",
                            ),
                            backgroundColor:
                                selectedOption == dailyQuestion["answer"]
                                    ? Colors.green
                                    : Colors.red,
                          ),
                        );
                      },
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
