// import 'package:flutter/material.dart';
// import 'package:livelife/Screens/HomeView.dart';

// import 'package:livelife/main.dart';

// class TimerScreen extends StatefulWidget {
//   TimerScreen() {
//     print("Timer screen constructor called");
//   }
//   @override
//   _TimerScreenState createState() => _TimerScreenState();
// }

// class _TimerScreenState extends State<TimerScreen> {
//   Duration duration = Duration(hours: 0, minutes: 0);

//   void _pickTime() async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime:
//           TimeOfDay(hour: duration.inHours, minute: duration.inMinutes % 60),
//     );
//     if (picked != null &&
//         picked !=
//             TimeOfDay(
//                 hour: duration.inHours, minute: duration.inMinutes % 60)) {
//       setState(() {
//         duration = Duration(hours: picked.hour, minutes: picked.minute);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Center(child: Text('Live Life')), // Title for the timer screen
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // Timer display
//               GestureDetector(
//                 onTap:
//                     _pickTime, // Call the _pickTime function when the circle is tapped
//                 child: Container(
//                   width: 200,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.blue, width: 4),
//                   ),
//                   child: Center(
//                     child: Text(
//                       '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}',
//                       style:
//                           TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),

//               SizedBox(height: 24), // For spacing
//               // Timer and Stopwatch buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   TextButton(
//                     onPressed: () {
//                       // Implement timer functionality
//                     },
//                     child: Text('Zamanlayıcı'),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       // Implement stopwatch functionality
//                     },
//                     child: Text('Kronometre'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         )
//         // bottomNavigationBar: bottomNavigationBar()
//         );
//   }
// }


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

