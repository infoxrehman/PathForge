import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:path_forge/auth/login_page.dart';
import 'package:path_forge/firebase_options.dart';
import 'package:path_forge/screens/dash_board.dart';
import 'package:path_forge/secrets/gemini_key.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // ✅ Only set persistence on Web to prevent errors
  if (kIsWeb) {
    await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
  }

  Gemini.init(apiKey: GEMINI_API_KEY);

  runApp(
    kIsWeb
        ? DevicePreview(
            backgroundColor: Colors.black,
            enabled: true,
            defaultDevice: Devices.ios.iPhone13ProMax,
            isToolbarVisible: true,
            availableLocales: const [Locale('en', 'US')],
            tools: const [
              DeviceSection(
                model: true,
                orientation: false,
                frameVisibility: false,
                virtualKeyboard: false,
              ),
            ],
            devices: [
              Devices.android.samsungGalaxyA50,
              Devices.android.samsungGalaxyNote20,
              Devices.android.samsungGalaxyS20,
              Devices.android.samsungGalaxyNote20Ultra,
              Devices.android.onePlus8Pro,
              Devices.android.sonyXperia1II,
              Devices.ios.iPhoneSE,
              Devices.ios.iPhone12,
              Devices.ios.iPhone12Mini,
              Devices.ios.iPhone12ProMax,
              Devices.ios.iPhone13,
              Devices.ios.iPhone13ProMax,
              Devices.ios.iPhone13Mini,
            ],
            builder: (BuildContext context) => const MyApp(),
          )
        : const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance
            .authStateChanges(), // ✅ Listen to auth state changes
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while checking auth state
            return const Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasData) {
            // User is signed in, navigate to Dashboard
            return const Dashboard();
          } else {
            // User is not signed in, navigate to LoginPage
            return const LoginPage();
          }
        },
      ),
    );
  }
}
