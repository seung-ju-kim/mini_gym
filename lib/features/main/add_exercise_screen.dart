import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minigym/constants/gaps.dart';
import 'package:minigym/constants/sizes.dart';

class AddExerciseScreen extends StatefulWidget {
  const AddExerciseScreen({super.key});

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
  State<AddExerciseScreen> createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
  bool _isSetOpened = false;

  void _onSavePress() {}
  void _addExerciseTap() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddExerciseScreen()));
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isSetOpened = false;
    });
  }

  void _onSetPressed() {
    setState(() {
      _isSetOpened = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("새로운 운동 추가"),
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
                  "운동 이름",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.v16,
                TextField(
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "벤치프레스",
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
                  "운동 볼륨",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.v16,
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: _onSetPressed,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size20,
                          vertical: Sizes.size10,
                        ),
                        child: Text(
                          "세트",
                          style: TextStyle(
                            fontSize: Sizes.size20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Gaps.h32,
                    OutlinedButton(
                      onPressed: _onSetPressed,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size20,
                          vertical: Sizes.size10,
                        ),
                        child: Text(
                          "kg",
                          style: TextStyle(
                            fontSize: Sizes.size20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: AnimatedContainer(
            height: _isSetOpened ? 300 : 0,
            duration: const Duration(
              milliseconds: 300,
            ),
            curve: Curves.fastOutSlowIn,
            child: BottomAppBar(
              elevation: 0,
              child: SizedBox(
                child: CupertinoPicker(
                  itemExtent: Sizes.size32,
                  onSelectedItemChanged: (int value) => {},
                  children: const [
                    Text("1세트"),
                    Text("2세트"),
                    Text("3세트"),
                    Text("4세트"),
                    Text("5세트"),
                    Text("6세트"),
                    Text("7세트"),
                    Text("8세트"),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
