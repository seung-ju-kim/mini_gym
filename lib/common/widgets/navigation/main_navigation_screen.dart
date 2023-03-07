import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:minigym/features/calendar/views/calendar_screen.dart';
import 'package:minigym/features/community/views/community_screen.dart';
import 'package:minigym/features/routine/views/routine_screen.dart';
import 'package:minigym/features/setting/views/setting_screen.dart';
import 'package:minigym/features/timer/views/timer_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  static const routeName = "mainNavigation";
  final String tab;
  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "community",
    "routine",
    "timer",
    "calendar",
    "profile",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Offstage(
          offstage: _selectedIndex != 0,
          child: const CommunityScreen(),
        ),
        Offstage(
          offstage: _selectedIndex != 1,
          child: const RoutineScreen(),
        ),
        Offstage(
          offstage: _selectedIndex != 2,
          child: const TimerScreen(),
        ),
        Offstage(
          offstage: _selectedIndex != 3,
          child: const CalendarScreen(),
        ),
        Offstage(
          offstage: _selectedIndex != 4,
          child: const SettingScreen(),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
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
              FontAwesomeIcons.comment,
            ),
            label: "커뮤니티",
          ),
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
            label: "타이머(Beta)",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.calendarCheck,
            ),
            label: "캘린더",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.gear,
            ),
            label: "설정",
          ),
        ],
      ),
    );
  }
}
