import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minigym/constants/sizes.dart';
import 'package:minigym/features/navigation/main_navigation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MiniGymApp());
}

class MiniGymApp extends StatelessWidget {
  const MiniGymApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mini Gym',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.grey.shade50,
            primaryColor: const Color(0xFFF59F00),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey.shade50,
              foregroundColor: Colors.black,
              elevation: 0,
              titleTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: Sizes.size16 + Sizes.size2,
                fontWeight: FontWeight.w600,
              ),
            ),
            bottomAppBarTheme: BottomAppBarTheme(
              color: Colors.grey.shade50,
            )),
        home: const MainNavigationScreen());
  }
}
