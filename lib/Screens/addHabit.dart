import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:livelife/Models/task.dart';
import 'package:livelife/Screens/MyHomePage.dart';
import 'package:livelife/Screens/homePage.dart';
import 'package:livelife/main.dart';

class HabitCreatePage extends StatefulWidget {
  final String userId;

  HabitCreatePage({Key? key, required this.userId}) : super(key: key) {
    print('HabitCreatePage constructor called $userId');
  }

  @override
  _HabitCreatePageState createState() => _HabitCreatePageState();
}

class _HabitCreatePageState extends State<HabitCreatePage> {
  final TextEditingController _nameController = TextEditingController();
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 30));
  TimeOfDay _reminderTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStart ? _startDate : _endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isStart ? _startDate : _endDate))
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _reminderTime,
    );
    if (picked != null && picked != _reminderTime)
      setState(() {
        _reminderTime = picked;
      });
  }

  Future<void> _selectBackground(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200, // Bu değeri isteğinize göre ayarlayın
          child: Center(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.circle),
                  iconColor: Colors.blue,
                  title: Text('Mavi'),
                  onTap: () {
                    // Arka plan olarak 'Mavi' seçeneği seçildi
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.circle),
                  iconColor: Colors.green,
                  title: Text('Yeşil'),
                  onTap: () {
                    // Arka plan olarak 'Yeşil' seçeneği seçildi
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.circle,
                  ),
                  iconColor: Colors.red,
                  title: Text('Kırmızı'),
                  onTap: () {
                    // Arka plan olarak 'Kırmızı' seçeneği seçildi
                    Navigator.pop(context);
                  },
                ),
                // Diğer arka plan seçenekleri...
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                _goBackHomePage(context);
              }),
          title: Text('Yeni Alışkanlık Oluştur'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Alışkanlık adı...'),
              ),
              ListTile(
                title: Text(
                    'Başlangıç tarihi: ${DateFormat('dd/MM/yy').format(_startDate)}'),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, true),
              ),
              ListTile(
                title: Text(
                    'Bitiş tarihi: ${DateFormat('dd/MM/yy').format(_endDate)}'),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, false),
              ),
              ListTile(
                title: Text('Anımsat: ${_reminderTime.format(context)}'),
                trailing: Icon(Icons.access_time),
                onTap: () => _selectTime(context),
              ),

              ListTile(
                title: Text("Arkaplan Seç"),
                trailing: Icon(Icons.color_lens),
                onTap: () => _selectBackground(context),
              ),
              SizedBox(height: 16.0), // Boşluk bırak (isteğe bağlı
              // Vazgeç ve Oluştur düğmeleri
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      // Vazgeçme işlevselliği ekle
                    },
                    child: Text('Vazgeç'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Alışkanlığı oluştur
                      _saveHabit(
                          startDay: _startDate,
                          endDay: _endDate,
                          reminderTime: _reminderTime,
                          name: _nameController.text,
                          description: 'Açıklama');
                      Navigator.pop(context, true);
                    },
                    child: Text('Oluştur'),
                    style: ElevatedButton.styleFrom(),
                  ),
                ],
              ),
            ],
          ),
        )
        // bottomNavigationBar: bottomNavigationBar()
        );
  }

  Future<void> _saveHabit(
      {required startDay,
      required DateTime endDay,
      required TimeOfDay reminderTime,
      required String name,
      required String description}) async {
    // ! in here must be backend logic
  }

  void _goBackHomePage(BuildContext context) {
    print("go gome back");
    Navigator.pop(context, true);
  }
}