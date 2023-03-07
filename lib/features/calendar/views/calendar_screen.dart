import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minigym/constants/breakpoints.dart';
import 'package:minigym/constants/sizes.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  static const routeName = "calendar_screen";
  static const routeURL = "/calendar";
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime _selectedDay = DateTime.now();
  late DateTime _focusedDay;

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size10,
        horizontal: Sizes.size20,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("운동 캘린더"),
          centerTitle: false,
        ),
        body: Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: Breakpoints.sm,
            ),
            child: TableCalendar(
              firstDay: DateTime.utc(2000, 01, 01),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: DateTime.now(),
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              locale: 'ko-KR',
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: const TextStyle(),
                weekendStyle: TextStyle(
                  color: Colors.red.shade300,
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                leftChevronIcon: FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  color: Theme.of(context).primaryColor,
                  size: Sizes.size16,
                ),
                rightChevronIcon: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Theme.of(context).primaryColor,
                  size: Sizes.size16,
                ),
              ),
              calendarStyle: CalendarStyle(
                weekendTextStyle: const TextStyle(),
                todayDecoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                  shape: BoxShape.circle,
                ),
                todayTextStyle: const TextStyle(),
                selectedDecoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              onDaySelected: (selectedDay, focusedDay) =>
                  _onDaySelected(selectedDay, focusedDay),
            ),
          ),
        ),
      ),
    );
  }
}
