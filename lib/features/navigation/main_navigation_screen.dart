import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minigym/features/main/routine_screen.dart';
import 'package:minigym/features/profile/profile_screen.dart';
import 'package:minigym/features/timer/timer_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _auth() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Stack getBody() {
    return Stack(children: [
      Offstage(
        offstage: _selectedIndex != 0,
        child: const RoutineScreen(),
      ),
      Offstage(
        offstage: _selectedIndex != 1,
        child: const TimerScreen(),
      ),
      Offstage(
        offstage: _selectedIndex != 2,
        child: Container(),
      ),
      Offstage(
        offstage: _selectedIndex != 3,
        child: const ProfileScreen(),
      ),
      // Offstage(
      //   offstage: _selectedIndex != 4,
      //   child: Container(),
      // ),
    ]);
  }

  BottomNavigationBar getBottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      onTap: _onTap,
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey.shade400,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.repeat,
          ),
          label: "루틴",
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.clock,
          ),
          label: "타이머",
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.calendarCheck,
          ),
          label: "달력",
        ),
        // BottomNavigationBarItem(
        //   icon: FaIcon(
        //     FontAwesomeIcons.comments,
        //   ),
        //   label: "커뮤니티",
        // ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.user,
          ),
          label: "프로필",
        ),
      ],
    );
  }
}
