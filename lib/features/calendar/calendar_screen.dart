import 'package:flutter/material.dart';
import 'package:minigym/constants/sizes.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size20,
        ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("운동 캘린더"),
            centerTitle: false,
          ),
          body: CalendarDatePicker(
            firstDate: DateTime.utc(2000, 01, 01),
            lastDate: DateTime.utc(2030, 12, 31),
            initialDate: DateTime.now(),
            onDateChanged: (time) {},
          ),
        ),
      ),
    );
  }
}
