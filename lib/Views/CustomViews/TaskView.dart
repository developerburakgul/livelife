import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:livelife/Models/task.dart';
import 'package:livelife/Utils/Extensions/ColorExtensions.dart';
import 'package:livelife/Views/Screens/HabitEditView.dart'; // ColorExtensions import edildi

class TaskView extends StatefulWidget {
  final Task task;
  final DateTime day; // Günün tamamlanma durumu için
  final VoidCallback? onEditPressed;
  final VoidCallback? onDeletePressed;

  const TaskView({
    Key? key,
    required this.task,
    required this.day,
    this.onEditPressed,
    this.onDeletePressed,
  }) : super(key: key);

  @override
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  late bool _isCompleted;

  @override
  void initState() {
    super.initState();
    // Günün tamamlanma durumunu ayarla
    _isCompleted = getCompletionStatus();
  }

  bool getCompletionStatus() {
    int dayIndex = widget.day.difference(widget.task.startDate).inDays;
    if (dayIndex >= 0 && dayIndex < widget.task.completionStatus.length) {
      return widget.task.completionStatus[dayIndex];
    }
    return false;
  }

  void toggleCompletionStatus() {
    setState(() {
      int dayIndex = widget.day.difference(widget.task.startDate).inDays;
      if (dayIndex >= 0 && dayIndex < widget.task.completionStatus.length) {
        widget.task.completionStatus[dayIndex] =
            !widget.task.completionStatus[dayIndex];
        _isCompleted = widget.task.completionStatus[dayIndex];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dayFormatted = DateFormat('dd/MM/yyyy').format(widget.day);
    final backgroundColor =
        ColorExtensions.fromHex(widget.task.backgroundColor);

    return Card(
      shape: StadiumBorder(),
      margin: const EdgeInsets.all(8),
      child: ListTile(
        shape: StadiumBorder(),
        tileColor: backgroundColor,
        leading: Checkbox(
          value: _isCompleted,
          onChanged: (bool? newValue) {
            toggleCompletionStatus();
          },
        ),
        title: Text(widget.task.name),
        subtitle: Text("${widget.task.description} - $dayFormatted"),
        trailing: PopupMenuButton<int>(
          onSelected: (item) => handleItemSelection(item),
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<int>(
              value: 0,
              child: ListTile(
                leading: Icon(Icons.edit),
                title: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Düzenle',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ),
            ),
            PopupMenuItem<int>(
              value: 1,
              child: ListTile(
                leading: Icon(Icons.delete),
                title: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Sil',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    )),
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
