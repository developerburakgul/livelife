// // // import 'package:flutter/material.dart';
// // // import 'package:intl/intl.dart';
// // // import 'package:livelife/Models/task.dart';
// // // import 'package:livelife/Utils/Extensions/ColorExtensions.dart';
// // // import 'package:livelife/Views/Screens/HabitEditView.dart'; // ColorExtensions import edildi

// // // class TaskView extends StatefulWidget {
// // //   final Task task;
// // //   final DateTime day; // Günün tamamlanma durumu için
// // //   final VoidCallback? onEditPressed;
// // //   final VoidCallback? onDeletePressed;

// // //   const TaskView({
// // //     Key? key,
// // //     required this.task,
// // //     required this.day,
// // //     this.onEditPressed,
// // //     this.onDeletePressed,
// // //   }) : super(key: key);

// // //   @override
// // //   _TaskViewState createState() => _TaskViewState();
// // // }

// // // class _TaskViewState extends State<TaskView> {
// // //   late bool _isCompleted;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     // Günün tamamlanma durumunu ayarla
// // //     _isCompleted = getCompletionStatus();
// // //   }

// // //   bool getCompletionStatus() {
// // //     int dayIndex = widget.day.difference(widget.task.startDate).inDays;
// // //     if (dayIndex >= 0 && dayIndex < widget.task.completionStatus.length) {
// // //       return widget.task.completionStatus[dayIndex];
// // //     }
// // //     return false;
// // //   }

// // //   void toggleCompletionStatus() {
// // //     print("OLDU MU LAN");
// // //     setState(() {
// // //       int dayIndex = widget.day.difference(widget.task.startDate).inDays;
// // //       if (dayIndex >= 0 && dayIndex < widget.task.completionStatus.length) {
// // //         widget.task.completionStatus[dayIndex] =
// // //             !widget.task.completionStatus[dayIndex];
// // //         _isCompleted = widget.task.completionStatus[dayIndex];

// // //       }

// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final dayFormatted = DateFormat('dd/MM/yyyy').format(widget.day);
// // //     final backgroundColor =
// // //         ColorExtensions.fromHex(widget.task.backgroundColor);

// // //     return Card(
// // //       shape: StadiumBorder(),
// // //       margin: const EdgeInsets.all(8),
// // //       child: ListTile(
// // //         shape: StadiumBorder(),
// // //         tileColor: backgroundColor,
// // //         leading: Checkbox(
// // //           value: _isCompleted,
// // //           onChanged: (bool? newValue) {
// // //             toggleCompletionStatus();
// // //           },
// // //         ),
// // //         title: Text(widget.task.name),
// // //         subtitle: Text("${widget.task.description} - $dayFormatted"),
// // //         trailing: PopupMenuButton<int>(
// // //           onSelected: (item) => handleItemSelection(item),
// // //           itemBuilder: (BuildContext context) => [
// // //             PopupMenuItem<int>(
// // //               value: 0,
// // //               child: ListTile(
// // //                 leading: Icon(Icons.edit),
// // //                 title: OutlinedButton(
// // //                   onPressed: () {},
// // //                   child: Text(
// // //                     'Düzenle',
// // //                     style: TextStyle(
// // //                         color: Theme.of(context).colorScheme.secondary),
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //             PopupMenuItem<int>(
// // //               value: 1,
// // //               child: ListTile(
// // //                 leading: Icon(Icons.delete),
// // //                 title: OutlinedButton(
// // //                     onPressed: () {},
// // //                     child: Text(
// // //                       'Sil',
// // //                       style: TextStyle(
// // //                           color: Theme.of(context).colorScheme.secondary),
// // //                     )),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   void handleItemSelection(int item) {
// // //     switch (item) {
// // //       case 0:
// // //         widget.onEditPressed?.call();
// // //         break;
// // //       case 1:
// // //         widget.onDeletePressed?.call();
// // //         break;
// // //     }
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:livelife/Models/task.dart';
// // import 'package:livelife/Utils/Extensions/ColorExtensions.dart';

// // class TaskView extends StatefulWidget {
// //   final Task task;
// //   final DateTime day;
// //   final VoidCallback? onEditPressed;
// //   final VoidCallback? onDeletePressed;
// //   final ValueChanged<bool>? onCompletionToggled;

// //   const TaskView({
// //     Key? key,
// //     required this.task,
// //     required this.day,
// //     this.onEditPressed,
// //     this.onDeletePressed,
// //     this.onCompletionToggled,
// //   }) : super(key: key);

// //   @override
// //   _TaskViewState createState() => _TaskViewState();
// // }

// // class _TaskViewState extends State<TaskView> {
// //   late bool _isCompleted;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _isCompleted = getCompletionStatus();
// //   }

// //   bool getCompletionStatus() {
// //     int dayIndex = widget.day.difference(widget.task.startDate).inDays;
// //     if (dayIndex >= 0 && dayIndex < widget.task.completionStatus.length) {
// //       return widget.task.completionStatus[dayIndex];
// //     }
// //     return false;
// //   }

// //   void toggleCompletionStatus() {
// //     print("TOGGLE BAŞLANGIÇ");
// //     setState(() {
// //       _isCompleted = !_isCompleted;
// //     });

// //     // Completion status değiştiğinde callback'i çağır
// //     widget.onCompletionToggled?.call(_isCompleted);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final dayFormatted = DateFormat('dd/MM/yyyy').format(widget.day);
// //     final backgroundColor =
// //         ColorExtensions.fromHex(widget.task.backgroundColor);

// //     return Card(
// //       shape: const StadiumBorder(),
// //       margin: const EdgeInsets.all(8),
// //       child: ListTile(
// //         shape: const StadiumBorder(),
// //         tileColor: backgroundColor,
// //         leading: Checkbox(
// //           value: _isCompleted,
// //           onChanged: (bool? newValue) {
// //             toggleCompletionStatus();
// //           },
// //         ),
// //         title: Text(widget.task.name),
// //         subtitle: Text("${widget.task.description} - $dayFormatted"),
// //         trailing: PopupMenuButton<int>(
// //           onSelected: (item) => handleItemSelection(item),
// //           itemBuilder: (BuildContext context) => [
// //             PopupMenuItem<int>(
// //               value: 0,
// //               child: ListTile(
// //                 leading: const Icon(Icons.edit),
// //                 title: const Text('Düzenle'),
// //               ),
// //             ),
// //             PopupMenuItem<int>(
// //               value: 1,
// //               child: ListTile(
// //                 leading: const Icon(Icons.delete),
// //                 title: const Text('Sil'),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   void handleItemSelection(int item) {
// //     switch (item) {
// //       case 0:
// //         widget.onEditPressed?.call();
// //         break;
// //       case 1:
// //         widget.onDeletePressed?.call();
// //         break;
// //     }
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:livelife/Models/task.dart';
// import 'package:livelife/Utils/Extensions/ColorExtensions.dart';

// class TaskView extends StatefulWidget {
//   final Task task;
//   final DateTime day;
//   final VoidCallback? onEditPressed;
//   final VoidCallback? onDeletePressed;
//   final ValueChanged<bool>? onCompletionToggled;

//   const TaskView({
//     Key? key,
//     required this.task,
//     required this.day,
//     this.onEditPressed,
//     this.onDeletePressed,
//     this.onCompletionToggled,
//   }) : super(key: key);

//   @override
//   _TaskViewState createState() => _TaskViewState();
// }

// class _TaskViewState extends State<TaskView> {
//   late bool _isCompleted;

//   @override
//   void initState() {
//     super.initState();
//     _isCompleted = getCompletionStatus();
//   }

//   bool getCompletionStatus() {
//     int dayIndex = widget.day.difference(widget.task.startDate).inDays;
//     // Görev başlangıç tarihi ile verilen gün arasındaki fark
//     if (dayIndex >= 0 && dayIndex < widget.task.completionStatus.length) {
//       return widget.task.completionStatus[dayIndex];
//     }
//     return false;
//   }

//   void toggleCompletionStatus() {
//     setState(() {
//       _isCompleted = !_isCompleted;
//     });

//     int dayIndex = widget.day.difference(widget.task.startDate).inDays;
//     if (dayIndex >= 0 && dayIndex < widget.task.completionStatus.length) {
//       widget.task.completionStatus[dayIndex] = _isCompleted;
//     }
//     print("TASK VİEW");
//     print(widget.task.completionStatus[dayIndex]);

//     widget.onCompletionToggled?.call(_isCompleted);
//   }

//   @override
//   void didUpdateWidget(covariant TaskView oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     // Widget güncellendiğinde, completion status kontrol et
//     if (widget.task != oldWidget.task || widget.day != oldWidget.day) {
//       setState(() {
//         _isCompleted = getCompletionStatus();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final dayFormatted = DateFormat('dd/MM/yyyy').format(widget.day);
//     final backgroundColor =
//         ColorExtensions.fromHex(widget.task.backgroundColor);

//     return Card(
//       shape: const StadiumBorder(),
//       margin: const EdgeInsets.all(8),
//       child: ListTile(
//         shape: const StadiumBorder(),
//         tileColor: backgroundColor,
//         leading: Checkbox(
//           value: _isCompleted,
//           onChanged: (bool? newValue) {
//             toggleCompletionStatus();
//           },
//         ),
//         title: Text(widget.task.name),
//         subtitle: Text("${widget.task.description} - $dayFormatted"),
//         trailing: PopupMenuButton<int>(
//           onSelected: (item) => handleItemSelection(item),
//           itemBuilder: (BuildContext context) => [
//             PopupMenuItem<int>(
//               value: 0,
//               child: ListTile(
//                 leading: const Icon(Icons.edit),
//                 title: const Text('Düzenle'),
//               ),
//             ),
//             PopupMenuItem<int>(
//               value: 1,
//               child: ListTile(
//                 leading: const Icon(Icons.delete),
//                 title: const Text('Sil'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void handleItemSelection(int item) {
//     switch (item) {
//       case 0:
//         widget.onEditPressed?.call();
//         break;
//       case 1:
//         widget.onDeletePressed?.call();
//         break;
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:livelife/Models/task.dart';
import 'package:livelife/Utils/Extensions/ColorExtensions.dart';

class TaskView extends StatefulWidget {
  final Task task;
  final DateTime day;
  final VoidCallback? onEditPressed;
  final VoidCallback? onDeletePressed;
  final ValueChanged<bool>? onCompletionToggled;

  const TaskView({
    Key? key,
    required this.task,
    required this.day,
    this.onEditPressed,
    this.onDeletePressed,
    this.onCompletionToggled,
  }) : super(key: key);

  @override
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  late bool _isCompleted;

  @override
  void initState() {
    super.initState();
    _isCompleted = getCompletionStatus();
  }

  bool getCompletionStatus() {
    int dayIndex = calculateDayIndex(widget.day);
    if (dayIndex >= 0 && dayIndex < widget.task.completionStatus.length) {
      return widget.task.completionStatus[dayIndex];
    }
    return false;
  }

  void toggleCompletionStatus(bool newValue) {
    int dayIndex = calculateDayIndex(widget.day);
    if (dayIndex >= 0 && dayIndex < widget.task.completionStatus.length) {
      widget.task.completionStatus[dayIndex] = newValue;
    }
    setState(() {
      _isCompleted = newValue;
    });

    widget.onCompletionToggled?.call(_isCompleted);
  }

  int calculateDayIndex(DateTime day) {
    DateTime taskStartDate = DateTime(widget.task.startDate.year,
        widget.task.startDate.month, widget.task.startDate.day);
    DateTime givenDay = DateTime(day.year, day.month, day.day);
    return givenDay.difference(taskStartDate).inDays;
  }

  @override
  void didUpdateWidget(covariant TaskView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.task != oldWidget.task || widget.day != oldWidget.day) {
      setState(() {
        _isCompleted = getCompletionStatus();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dayFormatted = DateFormat('dd/MM/yyyy').format(widget.day);
    final backgroundColor =
        ColorExtensions.fromHex(widget.task.backgroundColor);

    return Card(
      shape: const StadiumBorder(),
      margin: const EdgeInsets.all(8),
      child: ListTile(
        shape: const StadiumBorder(),
        tileColor: backgroundColor,
        leading: Checkbox(
          value: _isCompleted,
          onChanged: (bool? newValue) {
            toggleCompletionStatus(newValue!);
          },
        ),
        title: Text(widget.task.name),
        subtitle: Text("${widget.task.description} - $dayFormatted"),
        trailing: PopupMenuButton<int>(
          onSelected: handleItemSelection,
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<int>(
              value: 0,
              child: ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Düzenle'),
              ),
            ),
            PopupMenuItem<int>(
              value: 1,
              child: ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Sil'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleItemSelection(int item) {
    switch (item) {
      case 0:
        widget.onEditPressed?.call();
        break;
      case 1:
        widget.onDeletePressed?.call();
        break;
    }
  }
}


