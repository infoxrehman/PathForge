// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB0YnkbA9FpwwtoWVuImyLYJGSfsCdm-Xw',
    appId: '1:370391317448:web:cc12f1f28851b64aeb5efd',
    messagingSenderId: '370391317448',
    projectId: 'pathforge-f579c',
    authDomain: 'pathforge-f579c.firebaseapp.com',
    storageBucket: 'pathforge-f579c.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcwilt78FBgWAJciMRUOUeOpKo-9A-C9U',
    appId: '1:370391317448:android:93451c6188b71385eb5efd',
    messagingSenderId: '370391317448',
    projectId: 'pathforge-f579c',
    storageBucket: 'pathforge-f579c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKmGy8UdETVFaTkXRb0GlFHTGoQYt7psU',
    appId: '1:370391317448:ios:95d33b3eeed5e923eb5efd',
    messagingSenderId: '370391317448',
    projectId: 'pathforge-f579c',
    storageBucket: 'pathforge-f579c.firebasestorage.app',
    iosBundleId: 'com.example.pathForge',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBKmGy8UdETVFaTkXRb0GlFHTGoQYt7psU',
    appId: '1:370391317448:ios:95d33b3eeed5e923eb5efd',
    messagingSenderId: '370391317448',
    projectId: 'pathforge-f579c',
    storageBucket: 'pathforge-f579c.firebasestorage.app',
    iosBundleId: 'com.example.pathForge',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB0YnkbA9FpwwtoWVuImyLYJGSfsCdm-Xw',
    appId: '1:370391317448:web:c1a6d3537b0dc433eb5efd',
    messagingSenderId: '370391317448',
    projectId: 'pathforge-f579c',
    authDomain: 'pathforge-f579c.firebaseapp.com',
    storageBucket: 'pathforge-f579c.firebasestorage.app',
  );
}
