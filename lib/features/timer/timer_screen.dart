import 'dart:async';
import 'package:flutter/material.dart';
import 'package:minigym/constants/breakpoints.dart';
import 'package:minigym/constants/gaps.dart';
import 'package:minigym/constants/sizes.dart';
import 'package:minigym/utils.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _totalSeconds = 0;
  int _restSeconds = 0;
  bool _totalIsRunning = false;
  bool _restIsRunning = false;
  late Timer totalTimer = Timer(Duration.zero, () {});
  late Timer restTimer = Timer(Duration.zero, () {});

  void _onTotalTick(Timer timer) {
    setState(() {
      _totalSeconds += 1;
    });
  }

  void _onTotalStartPressed() {
    totalTimer = Timer.periodic(
      const Duration(
        seconds: 1,
      ),
      _onTotalTick,
    );

    setState(() {
      _totalIsRunning = true;
    });
  }

  void _onTotalPausePressed() {
    totalTimer.cancel();
    setState(() {
      _totalIsRunning = false;
    });
  }

  void _onTotalStopPressed() {
    totalTimer.cancel();
    setState(() {
      _totalIsRunning = false;
      _totalSeconds = 0;
    });
  }

  // 휴식 타이머
  void _onRestTick(Timer timer) {
    if (_restSeconds == 0) {
      restTimer.cancel();
      setState(() {
        _restIsRunning = false;
      });
    } else {
      setState(() {
        _restSeconds -= 1;
      });
    }
  }

  void _onRestStartPressed() {
    if (_restSeconds > 0) {
      restTimer = Timer.periodic(
        const Duration(
          seconds: 1,
        ),
        _onRestTick,
      );

      setState(() {
        _restIsRunning = true;
      });
    }
  }

  void _onRestPausePressed() {
    restTimer.cancel();
    setState(() {
      _restIsRunning = false;
    });
  }

  void _onRestStopPressed() {
    restTimer.cancel();

    setState(() {
      _restSeconds = 0;
      _restIsRunning = false;
    });
  }

  void _onSecondsPresssed(int second) {
    setState(() {
      _restSeconds += second;
    });
  }

  String format(int seconds) {
    if (seconds >= 3600) {
      var duration = Duration(seconds: seconds);
      return duration.toString().split(".")[0];
    } else {
      var duration = Duration(seconds: seconds);
      return duration.toString().split(".")[0].substring(
            2,
          );
    }
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
          title: const Text("운동 타이머"),
          centerTitle: false,
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: Breakpoints.sm,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gaps.v40,
                    Text(
                      "총 운동 시간",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: Sizes.size40,
                          ),
                    ),
                    Text(
                      format(_totalSeconds),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: Sizes.size60,
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size80,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: _totalIsRunning
                                ? _onTotalPausePressed
                                : _onTotalStartPressed,
                            child: Text(
                              _totalIsRunning ? "일시정지" : "운동시작",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          TextButton(
                            onPressed: _onTotalStopPressed,
                            child: Text(
                              "운동종료",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: Breakpoints.sm,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size10,
                ),
                margin: const EdgeInsets.only(
                  bottom: Sizes.size14,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5.0,
                      offset: const Offset(0, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(Sizes.size14),
                  color: isDarkMode(context) ? Colors.black : Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size20,
                    horizontal: Sizes.size24,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            "세트 간 휴식 타이머",
                            style: TextStyle(
                              color: isDarkMode(context)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Gaps.v10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            format(_restSeconds),
                            style: TextStyle(
                              fontSize: Sizes.size28,
                              color: isDarkMode(context)
                                  ? Colors.white
                                  : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      Gaps.v10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            onPressed: () => _onSecondsPresssed(10),
                            child: Text(
                              "+10초",
                              style: TextStyle(
                                color: isDarkMode(context)
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () => _onSecondsPresssed(30),
                            child: Text(
                              "+30초",
                              style: TextStyle(
                                color: isDarkMode(context)
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () => _onSecondsPresssed(60),
                            child: Text(
                              "+1분",
                              style: TextStyle(
                                color: isDarkMode(context)
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () => _onSecondsPresssed(300),
                            child: Text(
                              "+5분",
                              style: TextStyle(
                                color: isDarkMode(context)
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gaps.v10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: _restIsRunning
                                ? _onRestPausePressed
                                : _onRestStartPressed,
                            child: Text(
                              _restIsRunning ? "중지" : "시작",
                              style: TextStyle(
                                color: isDarkMode(context)
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: _onRestStopPressed,
                            child: Text(
                              "초기화",
                              style: TextStyle(
                                color: isDarkMode(context)
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
