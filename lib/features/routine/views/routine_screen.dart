import 'package:flutter/material.dart';
import 'package:minigym/common/widgets/routine_card.dart';

import 'package:minigym/constants/gaps.dart';
import 'package:minigym/constants/sizes.dart';
import 'package:minigym/features/routine/views/add_routine_screen.dart';

class RoutineScreen extends StatefulWidget {
  static const routeName = "routine_screen";
  static const routeURL = "/routine";
  const RoutineScreen({super.key});

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  final List<String> title = [
    '무분할 루틴',
  ];

  void _onAddTap() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddRoutineScreen()));
  }

  void _onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size10,
        horizontal: Sizes.size20,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("나의 루틴"),
          centerTitle: false,
          actions: <Widget>[
            TextButton(
              onPressed: _onPressed,
              child: TextButton(
                onPressed: _onAddTap,
                child: Text(
                  "추가하기",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            Gaps.h20,
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size10,
          ),
          child: ListView.separated(
            itemCount: title.length,
            itemBuilder: (context, index) => RoutineCard(
              mode: "my_routine",
              title: title[index],
            ),
            separatorBuilder: (context, index) => Gaps.v12,
          ),
        ),
      ),
    );
  }
}
