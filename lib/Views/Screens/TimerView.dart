import 'package:flutter/material.dart';
import 'package:livelife/Controller/ThemeController.dart';
import 'package:provider/provider.dart';

class TimerView extends StatelessWidget {
  final Duration duration;
  final VoidCallback onTimerPick;
  final VoidCallback onStartStop;
  final VoidCallback onReset;
  final VoidCallback onStartTimer;
  final VoidCallback onStartStopwatch;
  final bool isRunning;
  final bool isStopwatch;
  final bool isSelected;
  final String mode;

  TimerView({
    Key? key,
    required this.duration,
    required this.onTimerPick,
    required this.onStartStop,
    required this.onReset,
    required this.onStartTimer,
    required this.onStartStopwatch,
    required this.isRunning,
    required this.isStopwatch,
    required this.isSelected,
    required this.mode,
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
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 32.0), // Increased top padding
                child: Text(
                  mode,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            GestureDetector(
              onTap: onTimerPick,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary, width: 4),
                ),
                child: Center(
                  child: Text(
                    '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            if (!isSelected) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                      onPressed: onStartTimer,
                      child: Text('Zamanlayıcı',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary))),
                  TextButton(
                    onPressed: onStartStopwatch,
                    child: Text('Kronometre',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary)),
                  ),
                ],
              ),
            ] else ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (!isRunning)
                    TextButton(
                      onPressed: onStartStop,
                      child: Text('Başlat',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary)),
                    ),
                  if (isRunning)
                    TextButton(
                      onPressed: onStartStop,
                      child: Text('Durdur',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary)),
                    ),
                  TextButton(
                    onPressed: onReset,
                    child: Text('Sıfırla',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary)),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
