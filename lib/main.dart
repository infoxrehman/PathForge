import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:path_forge/auth/signup_page.dart';
import 'package:path_forge/firebase_options.dart';
import 'package:path_forge/screens/dash_board.dart';
import 'package:path_forge/secrets/gemini_key.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Gemini.init(apiKey: GEMINI_API_KEY);
  runApp(
    kIsWeb
        ? DevicePreview(
            // White background looks professional in website embedding
            backgroundColor: Colors.black,

            // Enable preview by default for web demo
            enabled: true,

            // Start with Galaxy A50 as it's a common Android device
            defaultDevice: Devices.ios.iPhone13ProMax,

            // Show toolbar to let users test different devices
            isToolbarVisible: true,

            // Keep English only to avoid confusion in demos
            availableLocales: const [Locale('en', 'US')],

            // Customize preview controls
            tools: const [
              // Device selection controls
              DeviceSection(
                model: true, // Option to change device model to fit your needs
                orientation: false, // Lock to portrait for consistent demo
                frameVisibility: false, // Hide frame options
                virtualKeyboard: false, // Hide keyboard
              ),
            ],

            // Curated list of devices for comprehensive preview
            devices: [
              // ... Devices.all, // uncomment to see all devices

              // Popular Android Devices
              Devices.android.samsungGalaxyA50, // Mid-range
              Devices.android.samsungGalaxyNote20, // Large screen
              Devices.android.samsungGalaxyS20, // Flagship
              Devices.android.samsungGalaxyNote20Ultra, // Premium
              Devices.android.onePlus8Pro, // Different aspect ratio
              Devices.android.sonyXperia1II, // Tall screen

              // Popular iOS Devices
              Devices.ios.iPhoneSE, // Small screen
              Devices.ios.iPhone12, // Standard size
              Devices.ios.iPhone12Mini, // Compact
              Devices.ios.iPhone12ProMax, // Large
              Devices.ios.iPhone13, // Latest standard
              Devices.ios.iPhone13ProMax, // Latest large
              Devices.ios.iPhone13Mini, // Latest compact
              Devices.ios.iPhoneSE, // Budget option
            ],

            /// Your app's entry point
            builder: (BuildContext context) => MyApp(),
          )
        : MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data != null) {
            return Dashboard();
          }
          return SignUpPage();
        },
      ),
    );
  }
}
