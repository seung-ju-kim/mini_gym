import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minigym/constants/gaps.dart';
import 'package:minigym/constants/sizes.dart';
import 'package:minigym/features/main/add_exercise_screen.dart';
import 'package:minigym/features/main/widgets/add_body_part_button.dart';

class AddRoutineScreen extends StatefulWidget {
  const AddRoutineScreen({super.key});

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
  State<AddRoutineScreen> createState() => _AddRoutineScreenState();
}

class _AddRoutineScreenState extends State<AddRoutineScreen> {
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
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("새로운 루틴 생성"),
          actions: [
            TextButton(
              onPressed: _onSavePress,
              child: const Text(
                "저장",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.size16,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                "루틴 이름",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v16,
              TextField(
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: "무분할 루틴",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v40,
              const Text(
                "운동 부위",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v16,
              Wrap(
                runSpacing: 3,
                spacing: 3,
                children: [
                  for (var part in AddRoutineScreen.bodyPart)
                    AddBodyPartButton(part: part)
                ],
              ),
              Gaps.v44,
              GestureDetector(
                onTap: _addExerciseTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    FaIcon(FontAwesomeIcons.squarePlus),
                    Gaps.h10,
                    Text(
                      "운동 추가하기",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
