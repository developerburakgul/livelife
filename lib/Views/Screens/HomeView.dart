import 'package:flutter/material.dart';
import 'package:livelife/Models/task.dart';
import 'package:livelife/Views/CustomViews/QuoteView.dart';
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
  final String quote;
  final String author;

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
    required this.quote,
    required this.author,
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
          QuoteView(
            quote: quote,
            author: author,
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

