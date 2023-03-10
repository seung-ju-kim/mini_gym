// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA8FNhT07JsfFP9a6nMaZ8EK8vF6LAZWLM',
    appId: '1:157027718653:web:38e2d54d01b134e359f594',
    messagingSenderId: '157027718653',
    projectId: 'mini-pt',
    authDomain: 'mini-pt.firebaseapp.com',
    storageBucket: 'mini-pt.appspot.com',
    measurementId: 'G-3PQJSP5LKN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKtZsOU1-xIXQXyFna-ZfT6-Zuv11X0Co',
    appId: '1:157027718653:android:41ac2e9aa5b9358259f594',
    messagingSenderId: '157027718653',
    projectId: 'mini-pt',
    storageBucket: 'mini-pt.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJpZwSM41DYnAR0VWkjiFKUvNobK4lJUY',
    appId: '1:157027718653:ios:b86ef54a8382191d59f594',
    messagingSenderId: '157027718653',
    projectId: 'mini-pt',
    storageBucket: 'mini-pt.appspot.com',
    iosClientId: '157027718653-a2g5p5hbpms48r6kukokg7fs4f9j2ukp.apps.googleusercontent.com',
    iosBundleId: 'com.example.minigym',
  );
}
