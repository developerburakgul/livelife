import 'package:flutter/material.dart';
import 'dart:async';

import 'package:livelife/Views/Screens/TimerView.dart';



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
  bool _isSelected = false;
  String _mode = "";

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

  void _startStop() {
    if (_isRunning) {
      _timer?.cancel();
      setState(() {
        _isRunning = false;
      });
    } else {
      if (_isStopwatch) {
        _startStopwatch();
      } else {
        _startTimer();
      }
    }
  }

  void _startTimer() {
    if (_isRunning) return;
    setState(() {
      _isRunning = true;
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
      _isSelected = false;
      _isStopwatch = false;
      _mode = "";
    });
  }

  void _selectTimer() {
    setState(() {
      _isStopwatch = false;
      _isSelected = true;
      _mode = "Zamanlayıcı";
    });
  }

  void _selectStopwatch() {
    setState(() {
      _isStopwatch = true;
      _isSelected = true;
      _mode = "Kronometre";
    });
  }

  @override
  Widget build(BuildContext context) {
    return TimerView(
      duration: _duration,
      onTimerPick: _pickTime,
      onStartStop: _startStop,
      onReset: _reset,
      isRunning: _isRunning,
      isStopwatch: _isStopwatch,
      isSelected: _isSelected,
      mode: _mode,
      onStartTimer: _selectTimer,
      onStartStopwatch: _selectStopwatch,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

