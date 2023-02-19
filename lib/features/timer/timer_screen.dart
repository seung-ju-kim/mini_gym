import 'dart:async';
import 'package:flutter/material.dart';
import 'package:minigym/constants/gaps.dart';
import 'package:minigym/constants/sizes.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "총 운동 시간",
                    style: TextStyle(
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    format(_totalSeconds),
                    style: const TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.w600,
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
                            style: const TextStyle(
                              fontSize: Sizes.size24,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: _onTotalStopPressed,
                          child: const Text(
                            "운동종료",
                            style: TextStyle(
                              fontSize: Sizes.size24,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size10,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: Sizes.size14,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5.0,
                      offset: const Offset(2, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(Sizes.size14),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size20,
                    horizontal: Sizes.size24,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text("세트 간 휴식 타이머"),
                        ],
                      ),
                      Gaps.v10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            format(_restSeconds),
                            style: const TextStyle(
                              fontSize: Sizes.size28,
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
                            child: const Text(
                              "+10초",
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () => _onSecondsPresssed(30),
                            child: const Text(
                              "+30초",
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () => _onSecondsPresssed(60),
                            child: const Text(
                              "+1분",
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () => _onSecondsPresssed(300),
                            child: const Text(
                              "+5분",
                              style: TextStyle(
                                color: Colors.black87,
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
                              style: const TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: _onRestStopPressed,
                            child: const Text(
                              "초기화",
                              style: TextStyle(
                                color: Colors.black87,
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
