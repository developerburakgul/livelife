import 'package:flutter/material.dart';

class TimerView extends StatelessWidget {
  final Duration duration;
  final VoidCallback onTimerPick;
  final VoidCallback onStartTimer;
  final VoidCallback onStartStopwatch;

  TimerView({
    Key? key,
    required this.duration,
    required this.onTimerPick,
    required this.onStartTimer,
    required this.onStartStopwatch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Live Life')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: onTimerPick,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 4),
                ),
                child: Center(
                  child: Text(
                    '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: onStartTimer,
                  child: Text('Zamanlayıcı'),
                ),
                TextButton(
                  onPressed: onStartStopwatch,
                  child: Text('Kronometre'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

