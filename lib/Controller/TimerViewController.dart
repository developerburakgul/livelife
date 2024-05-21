import 'package:flutter/material.dart';
import 'package:livelife/Views/Screens/TimerView.dart';
import 'dart:async';

class TimerViewController extends StatefulWidget {
  TimerViewController({Key? key}) : super(key: key);

  @override
  _TimerViewControllerState createState() => _TimerViewControllerState();
}

class _TimerViewControllerState extends State<TimerViewController> {
  Duration _duration = Duration(hours: 0, minutes: 0);
  Timer? _timer;
  bool _isRunning = false;
  bool _isStopwatch = false;

  void _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: _duration.inHours, minute: _duration.inMinutes % 60),
    );
    if (picked != null) {
      setState(() {
        _duration = Duration(hours: picked.hour, minutes: picked.minute);
      });
    }
  }

  void _startTimer() {
    if (_isRunning) return;
    setState(() {
      _isRunning = true;
      _isStopwatch = false;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_duration.inSeconds <= 0) {
          _timer?.cancel();
          _isRunning = false;
        } else {
          _duration -= Duration(seconds: 1);
        }
      });
    });
  }

  void _startStopwatch() {
    if (_isRunning) return;
    setState(() {
      _isRunning = true;
      _isStopwatch = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _duration += Duration(seconds: 1);
      });
    });
  }

  void _reset() {
    setState(() {
      _timer?.cancel();
      _isRunning = false;
      _duration = Duration(hours: 0, minutes: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TimerView(
      duration: _duration,
      onTimerPick: _pickTime,
      onStartTimer: _startTimer,
      onStartStopwatch: _startStopwatch,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
