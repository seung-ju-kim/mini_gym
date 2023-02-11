import 'package:flutter/material.dart';
import 'package:minigym/constants/gaps.dart';
import 'package:minigym/constants/sizes.dart';
import 'package:minigym/features/main/add_routine_screen.dart';
import 'package:minigym/features/main/widgets/routine_card.dart';

class RoutineScreen extends StatefulWidget {
  const RoutineScreen({super.key});

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  final List<String> title = [
    '무분할 루틴',
    "2분할 A",
    "2분할 B",
  ];

  void _onAddTap() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddRoutineScreen()));
  }

  void _onPressed() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
        child: Scaffold(
          appBar: getAppBar(),
          body: getBody(),
        ),
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      title: const Text("나의 루틴"),
      centerTitle: false,
      actions: <Widget>[
        TextButton(
          onPressed: _onPressed,
          child: TextButton(
            onPressed: _onAddTap,
            child: Text("추가하기",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                )),
          ),
        ),
        Gaps.h20,
      ],
    );
  }

  ListView getBody() {
    return ListView.separated(
      itemCount: title.length,
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size60,
      ),
      itemBuilder: (context, index) {
        return RoutineCard(
          title: title[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: Sizes.size10,
      ),
    );
  }
}
