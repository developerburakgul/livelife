// // import 'package:flutter/material.dart';
// // import 'package:livelife/Controller/HabitCreateViewController.dart';
// // import 'package:livelife/Models/Quote.dart';
// // import 'package:livelife/Models/task.dart';
// // import 'package:livelife/Services/QuoteService.dart';
// // import 'package:livelife/Services/task_service.dart';
// // import 'package:livelife/Utils/UtilFunctions.dart';
// // import 'package:table_calendar/table_calendar.dart';
// // import 'package:livelife/Views/Screens/HomeView.dart';
// // import 'package:livelife/Views/Screens/HabitCreateView.dart'; // AddHabitPage import edildi
// // import 'dart:async';

// // class HomeViewController extends StatefulWidget {
// //   final String userId;
// //   final TaskService taskService = TaskService();

// //   HomeViewController({Key? key, required this.userId}) : super(key: key);

// //   @override
// //   _HomeViewControllerState createState() => _HomeViewControllerState();
// // }

// // class _HomeViewControllerState extends State<HomeViewController> {
// //   CalendarFormat _calendarFormat = CalendarFormat.week;
// //   DateTime _focusedDay = DateTime.now();
// //   DateTime? _selectedDay;
// //   List<Task>? tasks;
// //   Quote quote = Quote(quote: "quote", author: "author");
// //   final QuoteService quoteService = QuoteService();
// //   Timer? _timer; // Timer nesnesi

// //   @override
// //   void initState() {
// //     super.initState();
// //     _selectedDay = _focusedDay;
// //     getTaskData(_focusedDay);
// //     fetchQuote();

// //     // Timer'ı belirli aralıklarla fetchQuote fonksiyonunu çağıracak şekilde başlat
// //     _timer = Timer.periodic(Duration(minutes: 60), (timer) {
// //       fetchQuote();
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _timer?.cancel(); // Widget yok edildiğinde Timer'ı iptal et
// //     super.dispose();
// //   }

// //   void fetchQuote() async {
// //     try {
// //       var fetchedQuote = await quoteService.fetchRandomQuote();

// //       setState(() {
// //         quote = fetchedQuote;
// //       });
// //     } catch (e) {
// //       print("Failed to fetch quote: $e");
// //     }
// //   }

// //   void toggleCalendarView() {
// //     setState(() {
// //       _calendarFormat = _calendarFormat == CalendarFormat.month
// //           ? CalendarFormat.week
// //           : CalendarFormat.month;
// //     });
// //   }

// //   void onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
// //     setState(() {
// //       _selectedDay = selectedDay;
// //       _focusedDay = focusedDay;
// //     });

// //     var newTasks = await widget.taskService
// //         .getTasksForUserOnDate(widget.userId, selectedDay);

// //     setState(() {
// //       tasks = newTasks;
// //     });
// //   }

// //   void getTaskData(DateTime date) async {
// //     var newTasks =
// //         await widget.taskService.getTasksForUserOnDate(widget.userId, date);

// //     setState(() {
// //       tasks = newTasks;
// //     });
// //   }

// //   void editTask(Task task) {}

// //   void deleteTask(Task task) async {
// //     try {
// //       await widget.taskService.deleteTask(task, widget.userId);
// //       getTaskData(_selectedDay!); // Silme işlemi sonrası verileri güncelle
// //       showCustomPopup(
// //           context: context, title: "aa", message: "Alışkanlık silindi.");
// //     } catch (e) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text("Failed to delete task: $e")),
// //       );
// //     }
// //   }

// //   void addHabit() async {
// //     final result = await Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => HabitCreateViewController(userId: widget.userId),
// //       ),
// //     );

// //     if (result == true) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text("Habit was successfully created!")),
// //       );
// //       getTaskData(
// //           _selectedDay!); // Yeni alışkanlık eklendikten sonra verileri güncelle
// //       print("Yeni görev eklendi ve veriler güncellendi.");
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return HomeView(
// //       calendarFormat: _calendarFormat,
// //       focusedDay: _focusedDay,
// //       selectedDay: _selectedDay,
// //       tasks: tasks,
// //       toggleCalendarView: toggleCalendarView,
// //       onDaySelected: onDaySelected,
// //       userId: widget.userId,
// //       onEditTask: editTask,
// //       onDeleteTask: deleteTask,
// //       onAddHabit: addHabit,
// //       quote: quote.quote,
// //       author: quote.author,
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:livelife/Controller/HabitCreateViewController.dart';
// import 'package:livelife/Models/Quote.dart';
// import 'package:livelife/Models/task.dart';
// import 'package:livelife/Services/QuoteService.dart';
// import 'package:livelife/Services/task_service.dart';
// import 'package:livelife/Utils/UtilFunctions.dart';
// import 'package:livelife/Views/Screens/HomeView.dart';
// import 'dart:async';

// import 'package:table_calendar/table_calendar.dart';

// class HomeViewController extends StatefulWidget {
//   final String userId;
//   final TaskService taskService = TaskService();

//   HomeViewController({Key? key, required this.userId}) : super(key: key);

//   @override
//   _HomeViewControllerState createState() => _HomeViewControllerState();
// }

// class _HomeViewControllerState extends State<HomeViewController> {
//   CalendarFormat _calendarFormat = CalendarFormat.week;
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   List<Task>? tasks;
//   Quote quote = Quote(quote: "quote", author: "author");
//   final QuoteService quoteService = QuoteService();
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     _selectedDay = _focusedDay;
//     getTaskData(_focusedDay);
//     fetchQuote();

//     _timer = Timer.periodic(Duration(minutes: 60), (timer) {
//       fetchQuote();
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   void fetchQuote() async {
//     try {
//       var fetchedQuote = await quoteService.fetchRandomQuote();

//       setState(() {
//         quote = fetchedQuote;
//       });
//     } catch (e) {
//       print("Failed to fetch quote: $e");
//     }
//   }

//   void toggleCalendarView() {
//     setState(() {
//       _calendarFormat = _calendarFormat == CalendarFormat.month
//           ? CalendarFormat.week
//           : CalendarFormat.month;
//     });
//   }

//   void onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
//     setState(() {
//       _selectedDay = selectedDay;
//       _focusedDay = focusedDay;
//     });

//     var newTasks = await widget.taskService
//         .getTasksForUserOnDate(widget.userId, selectedDay);

//     setState(() {
//       tasks = newTasks;
//     });
//   }

//   void getTaskData(DateTime date) async {
//     var newTasks =
//         await widget.taskService.getTasksForUserOnDate(widget.userId, date);

//     setState(() {
//       tasks = newTasks;
//     });
//   }

//   void editTask(Task task) {}

//   void deleteTask(Task task) async {
//     try {
//       await widget.taskService.deleteTask(task, widget.userId);
//       getTaskData(_selectedDay!);
//       showCustomPopup(
//           context: context, title: "Başarılı", message: "Görev silindi.");
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to delete task: $e")),
//       );
//     }
//   }

//   void addHabit() async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => HabitCreateViewController(userId: widget.userId),
//       ),
//     );

//     if (result == true) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Alışkanlık başarıyla oluşturuldu!")),
//       );
//       getTaskData(_selectedDay!);
//     }
//   }

//   Future<void> updateTaskCompletionStatus(
//       Task task, DateTime day, bool isCompleted) async {
//     await widget.taskService
//         .updateTaskCompletionStatus(widget.userId, task, day, isCompleted);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return HomeView(
//       calendarFormat: _calendarFormat,
//       focusedDay: _focusedDay,
//       selectedDay: _selectedDay,
//       tasks: tasks,
//       toggleCalendarView: toggleCalendarView,
//       onDaySelected: onDaySelected,
//       userId: widget.userId,
//       onEditTask: editTask,
//       onDeleteTask: deleteTask,
//       onAddHabit: addHabit,
//       updateTaskCompletionStatus: updateTaskCompletionStatus,
//       quote: quote.quote,
//       author: quote.author,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:livelife/Controller/HabitCreateViewController.dart';
import 'package:livelife/Controller/HabitEditViewController.dart';
import 'package:livelife/Models/Quote.dart';
import 'package:livelife/Models/task.dart';
import 'package:livelife/Services/QuoteService.dart';
import 'package:livelife/Services/task_service.dart';
import 'package:livelife/Utils/UtilFunctions.dart';
import 'package:livelife/Views/Screens/HomeView.dart';
import 'dart:async';

import 'package:table_calendar/table_calendar.dart';

class HomeViewController extends StatefulWidget {
  final String userId;
  final TaskService taskService = TaskService();

  HomeViewController({Key? key, required this.userId}) : super(key: key);

  @override
  _HomeViewControllerState createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends State<HomeViewController> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<Task>? tasks;
  Quote quote = Quote(quote: "quote", author: "author");
  final QuoteService quoteService = QuoteService();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    getTaskData(_focusedDay);
    fetchQuote();

    _timer = Timer.periodic(Duration(seconds: 60), (timer) {
      fetchQuote();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void fetchQuote() async {
    try {
      var fetchedQuote = await quoteService.fetchRandomQuote();

      setState(() {
        quote = fetchedQuote;
      });
    } catch (e) {
      print("Failed to fetch quote: $e");
    }
  }

  void toggleCalendarView() {
    setState(() {
      _calendarFormat = _calendarFormat == CalendarFormat.month
          ? CalendarFormat.week
          : CalendarFormat.month;
    });
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });

    getTaskData(selectedDay);
    print("ON DAY SELECTED BİTTİ");
  }

  

  void getTaskData(DateTime date) async {
    var newTasks = await widget.taskService.getTasksForUserOnDate(widget.userId, date);
    setState(() {
      tasks = newTasks;
    });

    // Print tasks of completionStatus
    for (var task in tasks!) {
      print('Task: ${task.name}, Completion Status: ${task.completionStatus}');
    }
  }

 


  // void editTask(Task task) {
  //   // Burada görev düzenleme işlemlerini ekleyin
  //   print('Görev düzenleniyor: ${task.name}');
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => HabitEditViewController(userId: widget.userId, task: task),
  //     ),
  //   );
  // }
  // HomeViewController içinde
  void editTask(Task task) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            HabitEditViewController(userId: widget.userId, task: task),
      ),
    );

    if (result == true) {
      // Eğer result true ise, görevler güncellenmeli
      getTaskData(_selectedDay!);
    }
  }


  void deleteTask(Task task) async {
    try {
      await widget.taskService.deleteTask(task, widget.userId);
      getTaskData(_selectedDay!);
      showCustomPopup(
          context: context, title: "Başarılı", message: "Görev silindi.");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to delete task: $e")),
      );
    }
  }

  void addHabit() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HabitCreateViewController(userId: widget.userId),
      ),
    );

    if (result == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Alışkanlık başarıyla oluşturuldu!")),
      );
      getTaskData(_selectedDay!);
    }
  }

  Future<void> toggleCompletionStatus(
      Task task, DateTime day, bool isCompleted) async {
    try {
      await widget.taskService
          .updateTaskCompletionStatus(widget.userId, task, day, isCompleted);
      // Görev güncellendikten sonra verileri tekrar çek
      getTaskData(day);
    } catch (e) {
      // Hata işleme, kullanıcıya hata mesajı gösterme vs.
      print('Görev durumu güncellenemedi: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(
      calendarFormat: _calendarFormat,
      focusedDay: _focusedDay,
      selectedDay: _selectedDay,
      tasks: tasks,
      toggleCalendarView: toggleCalendarView,
      onDaySelected: onDaySelected,
      userId: widget.userId,
      onEditTask: editTask,
      onDeleteTask: deleteTask,
      onAddHabit: addHabit,
      updateTaskCompletionStatus: toggleCompletionStatus,
      quote: quote.quote,
      author: quote.author,
    );
  }
}
