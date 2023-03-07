import 'package:flutter/material.dart';
import 'package:minigym/common/widgets/routine_card.dart';
import 'package:minigym/constants/gaps.dart';
import 'package:minigym/constants/sizes.dart';
import 'package:minigym/features/routine/views/add_exercise_screen.dart';

class ShareMyRoutineScreen extends StatefulWidget {
  const ShareMyRoutineScreen({super.key});

  static const bodyPart = [
    "가슴",
    "등",
    "하체",
    "어깨",
    "팔",
    "복근",
    "전신",
    "유산소",
  ];

  @override
  State<ShareMyRoutineScreen> createState() => _ShareMyRoutineScreenState();
}

class _ShareMyRoutineScreenState extends State<ShareMyRoutineScreen> {
  final List<String> title = [
    '무분할 루틴',
  ];

  void _onSavePress() {}
  void _addExerciseTap() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddExerciseScreen()));
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: TextButton(
              onPressed: () {},
              child: Text(
                "저장",
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
          horizontal: Sizes.size20,
        ),
        child: ListView.separated(
          itemCount: title.length,
          itemBuilder: (context, index) => RoutineCard(
            mode: "share_routine",
            title: title[index],
          ),
          separatorBuilder: (context, index) => Gaps.v12,
        ),
      ),
    );
  }
}
