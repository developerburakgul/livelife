// import 'package:flutter/material.dart';
// import 'package:livelife/Models/task.dart';
// import 'package:livelife/Screens/addHabit.dart';
// import 'package:livelife/main.dart';
// import 'package:table_calendar/table_calendar.dart';

// class HomePage extends StatefulWidget {
//   final String userId;

//   HomePage({Key? key, required this.userId}) : super(key: key) {
//     print('HomePage constructor called ');
//   }

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   CalendarFormat _calendarFormat = CalendarFormat.week;
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;

//   List<Task>? tasks;

//   @override
//   void initState() {
//     print("Homepage init state çalıştı");
//     super.initState();
//     getTaskData(); // Verileri yüklemek için
//   }

//   void _toggleCalendarView() {
//     setState(() {
//       _calendarFormat = _calendarFormat == CalendarFormat.month
//           ? CalendarFormat.week
//           : CalendarFormat.month;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Center(child: Text('Live Life')),
//         ),
//         body: ListView(
//           children: <Widget>[
//             // Week view calendar
//             TableCalendar(
//               firstDay: DateTime.utc(2020, 1, 1),
//               lastDay: DateTime.utc(2040, 1, 1),
//               focusedDay: _focusedDay,
//               calendarFormat: _calendarFormat,
//               selectedDayPredicate: (day) {
//                 return isSameDay(_selectedDay, day);
//               },
//               onDaySelected: (selectedDay, focusedDay) {
//                 _onDaySelected(selectedDay, focusedDay);
//               },
//               onPageChanged: (focusedDay) {
//                 _focusedDay = focusedDay;
//               },
//               daysOfWeekStyle: DaysOfWeekStyle(
//                 weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
//               ),
//               headerStyle: const HeaderStyle(
//                 titleCentered: true,
//                 formatButtonVisible: false,
//                 // Bu özellik format düğmelerini kaldırır
//               ),
//               // Your other calendar styling
//             ),

//             IconButton(
//               icon: Icon(
//                 _calendarFormat == CalendarFormat.week
//                     ? Icons.expand_more
//                     : Icons.expand_less,
//                 size: 25,
//                 color: Color.fromARGB(255, 58, 58, 58),
//               ),
//               onPressed: _toggleCalendarView,
//             ),
//             TaskCard(title: "Task 1"),
//             // ! Motivational quote section
//             // ! MotivationCard(
//             //  !  title: 'Motivation Quotes',
//             // !    quotes: [],
//             //!   ),
//             //! Task List
//             if (tasks != null)
//               for (Task task in tasks!) TaskCard(title: task.name),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             final result = await Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => HabitCreatePage(userId: widget.userId)),
//             );
//             if (result == true) {
//               print("result: $result");
//               getTaskData();
//             }
//           },
//           child: Icon(Icons.add),
//           backgroundColor: Colors.blue,
//         ));
//   }

//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     setState(() {
//       _selectedDay = selectedDay;
//       _focusedDay = focusedDay;
//     });
//   }

//   void getTaskData() async {
//     print("getTaskData başladı");
//     // ! in here must be backend logic
//   }
// }

// class MotivationCard extends StatelessWidget {
//   final String title;
//   final List<String> quotes;

//   const MotivationCard({Key? key, required this.title, required this.quotes})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 color: Colors.blue,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: quotes.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 4),
//                   child: Text(
//                     quotes[index],
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TaskCard extends StatefulWidget {
//   final String title;
//   // final double progress;
//   final bool isChecked;
//   final ValueChanged<bool>? onChanged;
//   final VoidCallback? onEditPressed;
//   final VoidCallback? onDeletePressed;

//   const TaskCard({
//     Key? key,
//     required this.title,
//     //required this.progress,
//     this.isChecked = false,
//     this.onChanged,
//     this.onEditPressed,
//     this.onDeletePressed,
//   }) : super(key: key);

//   @override
//   _TaskCardState createState() => _TaskCardState();
// }

// class _TaskCardState extends State<TaskCard> {
//   bool _isChecked = false;

//   @override
//   void initState() {
//     super.initState();
//     _isChecked = widget.isChecked;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(8),
//       child: ListTile(
//         leading: SizedBox(
//           width: 15,
//           height: 15,
//           child: Checkbox(
//             value: _isChecked,
//             onChanged: (value) {
//               setState(() {
//                 _isChecked = value ?? false;
//                 widget.onChanged?.call(_isChecked);
//               });
//             },
//           ),
//         ),
//         title: Text(widget.title),
//         // subtitle: LinearProgressIndicator(
//         //   value: widget.progress,
//         // ),
//         trailing: PopupMenuButton(
//           shape: ShapeBorder.lerp(
//             RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             1,
//           ),
//           itemBuilder: (BuildContext context) => <PopupMenuEntry>[
//             PopupMenuItem(
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     left: 1.0, right: 1.0, bottom: 1.0, top: 1.0),
//                 child: ListTile(
//                   leading: Icon(Icons.edit),
//                   title: Text('Edit'),
//                   onTap: () {
//                     Navigator.pop(context);
//                     widget.onEditPressed?.call();
//                   },
//                 ),
//               ),
//             ),
//             PopupMenuItem(
//               child: ListTile(
//                 leading: Icon(Icons.delete),
//                 title: Text('Delete'),
//                 onTap: () {
//                   Navigator.pop(context);
//                   widget.onDeletePressed?.call();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:livelife/Models/task.dart';
import 'package:livelife/Views/CustomViews/TaskView.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeView extends StatelessWidget {
  final CalendarFormat calendarFormat;
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final List<Task>? tasks;
  final Function toggleCalendarView;
  final Function(DateTime, DateTime) onDaySelected;
  final String userId;
  final Function(Task) onEditTask;
  final Function(Task) onDeleteTask;
  final Function() onAddHabit;

  HomeView({
    required this.calendarFormat,
    required this.focusedDay,
    required this.selectedDay,
    required this.tasks,
    required this.toggleCalendarView,
    required this.onDaySelected,
    required this.userId,
    required this.onEditTask,
    required this.onDeleteTask,
    required this.onAddHabit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Live Life')),
        // automaticallyImplyLeading: false, // Bu satırı ekleyin
      ),
      body: ListView(
        children: <Widget>[
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2040, 1, 1),
            focusedDay: focusedDay,
            calendarFormat: calendarFormat,
            selectedDayPredicate: (day) => isSameDay(selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) =>
                onDaySelected(selectedDay, focusedDay),
            onPageChanged: (focusedDay) {
              this.onDaySelected(focusedDay, focusedDay);
            },
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
            ),
            headerStyle: const HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
            ),
          ),
          IconButton(
            icon: Icon(
              calendarFormat == CalendarFormat.week
                  ? Icons.expand_more
                  : Icons.expand_less,
              size: 25,
              color: Color.fromARGB(255, 58, 58, 58),
            ),
            onPressed: () => toggleCalendarView(),
          ),
          if (tasks != null && selectedDay != null)
            for (Task task in tasks!)
              TaskView(
                task: task,
                day: selectedDay!,
                onEditPressed: () => onEditTask(task),
                onDeletePressed: () => onDeleteTask(task),
              ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAddHabit,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}


