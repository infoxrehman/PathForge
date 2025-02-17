import 'package:flutter/material.dart';
import 'package:path_forge/utils/base.dart';

// AI-Screen
class ArtificialIntelligenceScreen extends StatelessWidget {
  const ArtificialIntelligenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Base(
      title: "Artificial Intelligence",
      animationPath: 'assets/animations/AI-animation.json',
      sections: [
        TechnologySection(
          title: "What is Artificial Intelligence?",
          content:
              "Artificial Intelligence (AI) is the simulation of human intelligence in machines that are programmed to think, learn, and make decisions. It includes technologies like machine learning, natural language processing, and computer vision.",
          gradientColors: [Colors.deepPurple, Colors.purpleAccent],
        ),
        TechnologySection(
          title: "Why should you learn about AI?",
          content:
              "AI is revolutionizing industries, from healthcare to finance, making tasks more efficient and data-driven. Learning AI equips you with problem-solving skills, enhances career opportunities, and enables you to create innovative solutions for real-world challenges.",
          gradientColors: [Colors.indigo, Colors.blueAccent],
        ),
      ],
      onStartLearning: () {
        // Add your navigation logic here
      },
    );
  }
}

// web-development
class WebDevelopmentScreen extends StatelessWidget {
  const WebDevelopmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Base(
      title: "Web Development",
      animationPath: 'assets/animations/Web-animation.json',
      sections: [
        TechnologySection(
          title: "What is Web Development?",
          content:
              "Web Development is the process of building websites and web applications that run on the internet. It involves both frontend (client-side) and backend (server-side) development, using technologies like HTML, CSS, JavaScript, and various backend frameworks.",
          gradientColors: [Colors.blue, Colors.lightBlueAccent],
        ),
        TechnologySection(
          title: "Why should you learn Web Development?",
          content:
              "Web development skills are in high demand across industries. Learning web development opens doors to numerous career opportunities, allowing you to build websites, applications, and interactive user experiences. It is essential for anyone interested in creating digital solutions.",
          gradientColors: [Colors.green, Colors.tealAccent],
        ),
      ],
      onStartLearning: () {
        // Add your navigation logic here
      },
    );
  }
}

// Machine-Learning
class MachineLearningScreen extends StatelessWidget {
  const MachineLearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Base(
      title: "Machine Learning",
      animationPath: 'assets/animations/bot.json',
      sections: [
        TechnologySection(
          title: "What is Machine Learning?",
          content:
              "Machine Learning (ML) is a subset of AI that enables systems to learn from data and make decisions without explicit programming. It includes techniques like supervised, unsupervised, and reinforcement learning.",
          gradientColors: [Colors.blueGrey, Colors.lightBlueAccent],
        ),
        TechnologySection(
          title: "Why should you learn ML?",
          content:
              "ML is transforming industries, from healthcare to finance, by enabling automation, predictive analysis, and intelligent decision-making. Learning ML can open up vast career opportunities and empower you to solve real-world problems.",
          gradientColors: [Colors.deepOrange, Colors.amber],
        ),
      ],
      onStartLearning: () {
        // Add your navigation logic here
      },
    );
  }
}

// DataScience
class DataScienceScreen extends StatelessWidget {
  const DataScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Base(
      title: "Data Science",
      animationPath: 'assets/animations/datascience.json',
      sections: [
        TechnologySection(
          title: "What is Data Science?",
          content:
              "Data Science is a multidisciplinary field that uses scientific methods, processes, algorithms, and systems to extract knowledge and insights from structured and unstructured data. It combines skills in programming, statistics, and domain expertise to solve complex problems and drive decision-making. Professionals in this field often use tools like Python, R, SQL, and machine learning frameworks to analyze and visualize data effectively.",
          gradientColors: [Colors.blueGrey.shade800, Colors.blueGrey.shade600],
        ),
        TechnologySection(
          title: "Why Data Science?",
          content:
              "Data Science is at the core of innovation, enabling businesses and researchers to make data-driven decisions. By pursuing a career in Data Science, you can work on exciting projects like AI, machine learning, predictive modeling, and more. It offers immense opportunities in diverse sectors such as healthcare, finance, e-commerce, and technology, making it one of the most sought-after skills in the job market.",
          gradientColors: [
            Colors.deepPurple.shade800,
            Colors.deepPurple.shade600
          ],
        ),
      ],
      onStartLearning: () {
        // Add your navigation logic here
      },
    );
  }
}

// cloud-computing
class CloudComputingScreen extends StatelessWidget {
  const CloudComputingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Base(
      title: "Cloud Computing",
      animationPath: 'assets/animations/cloud.json',
      sections: [
        TechnologySection(
          title: "What is Cloud Computing?",
          content:
              "Cloud computing is the delivery of computing services like servers, storage, databases, networking, software, and more over the internet ('the cloud'). It offers faster innovation, flexible resources, and economies of scale.",
          gradientColors: [Colors.blueGrey.shade800, Colors.blueGrey.shade600],
        ),
        TechnologySection(
          title: "Why Choose Cloud Computing?",
          content: "1. Cost Efficiency: Pay only for what you use.\n"
              "2. Scalability: Easily scale resources up or down.\n"
              "3. Flexibility: Access data and applications from anywhere.\n"
              "4. Security: Advanced security features to protect your data.\n"
              "5. Career Growth: High demand for cloud professionals.",
          gradientColors: [
            Colors.deepPurple.shade800,
            Colors.deepPurple.shade600
          ],
        ),
      ],
      onStartLearning: () {
        // Add your navigation logic here
      },
    );
  }
}

// AppDevelopmentScreen
class AppDevelopmentScreen extends StatelessWidget {
  const AppDevelopmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Base(
      title: "App Development",
      animationPath: 'assets/animations/app-development.json',
      sections: [
        TechnologySection(
          title: "What is App Development?",
          content:
              "App development is a crucial skill in today's technology-driven world. "
              "Whether you're building apps for Android or iOS, native or cross-platform "
              "technologies can help you create user-friendly, scalable, and high-performing applications.",
          gradientColors: [Colors.blueGrey.shade800, Colors.blueGrey.shade600],
        ),
        TechnologySection(
          title: "Choose Your Development Path",
          content:
              "Select whether you want to build native apps tailored to specific platforms, "
              "or cross-platform apps that work seamlessly on multiple platforms.",
          gradientColors: [
            Colors.deepPurple.shade800,
            Colors.deepPurple.shade600
          ],
        ),
      ],
      onStartLearning: () {
        // Add your navigation logic here
      },
    );
  }
}

class CrossPlatformOptionsWidget extends StatelessWidget {
  const CrossPlatformOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Base(
      title: "Cross-Platform Development",
      animationPath: 'assets/animations/cross-platform.json',
      sections: [
        TechnologySection(
          title: "Flutter Roadmap",
          content:
              "Flutter is a UI framework for building beautiful, natively compiled applications from a single codebase.",
          gradientColors: [Colors.blue, Colors.cyan],
        ),
        TechnologySection(
          title: "React Native Roadmap",
          content:
              "React Native allows you to build mobile apps using JavaScript and React for a seamless cross-platform experience.",
          gradientColors: [Colors.cyan, Colors.teal],
        ),
      ],
      onStartLearning: () {
        // Add your navigation logic here
      },
    );
  }
}

class NativeOptionsWidget extends StatelessWidget {
  const NativeOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Base(
      title: "Native Development",
      animationPath: 'assets/animations/native-development.json',
      sections: [
        TechnologySection(
          title: "Java Roadmap",
          content:
              "Java is a powerful programming language widely used for Android development. It's known for its reliability, robustness, and extensive libraries.",
          gradientColors: [Colors.orange, Colors.yellow],
        ),
        TechnologySection(
          title: "Kotlin Roadmap",
          content:
              "Kotlin is a modern, concise, and expressive language officially supported for Android development. It enhances productivity and ensures code safety.",
          gradientColors: [Colors.green, Colors.lime],
        ),
      ],
      onStartLearning: () {
        // Add your navigation logic here
      },
    );
  }
}
